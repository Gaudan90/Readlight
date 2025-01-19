import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../screens/role_selection_screen.dart';
import '../states/create_account_state.dart';
import 'package:dnsolve/dnsolve.dart';
import '../utilities/navigation_helper.dart';

class CreateAccountScreenController extends ChangeNotifier {
  final CreateAccountScreenState state;
  final _supabase = Supabase.instance.client;
  final _dnsolver = DNSolve();

  CreateAccountScreenController({
    required this.state,
  });

  // Checks if email is valid through syntax and DNS!
  Future<bool> _isValidEmail(String email) async {
    if (!email.contains('@')) return false;
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
      return false;
    }

    try {
      final domain = email.split('@')[1];

      // Checking record MX (Mail Exchange)!
      final mxResponse = await _dnsolver.lookup(
        domain,
        type: RecordType.mx,
        dnsSec: true,
      );
      if (mxResponse.answer?.records?.isNotEmpty ?? false) {
        return true;
      }

      // If no MX are found, record A (Answer) is a fallback!
      final aResponse = await _dnsolver.lookup(
        domain,
        type: RecordType.A,
        dnsSec: true,
      );
      return aResponse.answer?.records?.isNotEmpty ?? false;

    } catch (e) {
      return false;
    }
  }

  bool _isValidUsername(String username) {
    if (username.length < 3) return false;
    if (username.length > 20) return false;
    return RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username);
  }

  String? _validatePassword(String password) {
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must have at least a capitol character';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must have at least a number';
    }
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must have at least a special character';
    }
    return null;
  }

  Future<void> handleCreateAccount(BuildContext context) async {
    try {
      _showLoadingDialog(context);

      final isEmailValid = await _isValidEmail(state.emailController.text);
      if (!isEmailValid) {
        if (context.mounted) {
          Navigator.of(context).pop();
          _showErrorMessage(context, 'Invalid email or non-existing domain');
        }
        return;
      }

      if (!_isValidUsername(state.usernameController.text)) {
        if (context.mounted) {
          Navigator.of(context).pop();
          _showErrorMessage(
              context,
              'Username must be 3-20 characters and contain only letters, numbers, and underscore'
          );
        }
        return;
      }

      final passwordError = _validatePassword(state.passwordController.text);
      if (passwordError != null) {
        if (context.mounted) {
          Navigator.of(context).pop();
          _showErrorMessage(context, passwordError);
        }
        return;
      }

      // User registration with Supabase!!
      final authResponse = await _supabase.auth.signUp(
        email: state.emailController.text,
        password: state.passwordController.text,
        data: {
          'username': state.usernameController.text,
        },
      );

      // Check if user creation was successful
      if (authResponse.user == null) {
        debugPrint('Error: authResponse.user is null');
        throw Exception('Error during account creation: user is null');
      }

      try {
        await _supabase.from('profiles').insert({
          'id': authResponse.user!.id,
          'email': state.emailController.text,
          'username': state.usernameController.text,
          'subscribed_to_newsletter': state.newsletterState.controller.isChecked,
          'created_at': DateTime.now().toIso8601String(),
        }).select();
      } catch (e) {
        await _supabase.auth.admin.deleteUser(authResponse.user!.id);
        throw Exception('Error during profile creation');
      }

      if (context.mounted) {
        Navigator.of(context).pop();
        NavigationHelper.turnPageNavigate(
          context: context,
          page: const RoleSelectionScreen(),
        );


        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully! Check your email to verify your account.'),
            duration: Duration(seconds: 5),
          ),
        );
      }
    } on AuthException catch (error) {
      debugPrint('AuthException: ${error.message}');
      if (context.mounted) {
        Navigator.of(context).pop();
        _showErrorMessage(context, _getAuthErrorMessage(error.message));
      }
    } catch (error) {
      debugPrint('Generic error: $error');
      if (context.mounted) {
        Navigator.of(context).pop();
        _showErrorMessage(context, 'An error occurred during account creation: $error');
      }
    }
  }

  String _getAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'User already registered':
        return 'An account with this email already exists.';
      case 'Invalid email':
        return 'Email not valid.';
      case 'Weak password':
        return 'Password is too weak, try a stronger one.';
      default:
        return 'An error occurred during registration';
    }
  }
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}