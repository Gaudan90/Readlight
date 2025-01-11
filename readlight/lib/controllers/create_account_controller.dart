import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../screens/role_selection_screen.dart';
import '../states/create_account_state.dart';
import '../theme/app_colors.dart';

class CreateAccountScreenController extends ChangeNotifier {
  final CreateAccountScreenState state;

  CreateAccountScreenController({
    required this.state,
  });

  //TODO: check with DNS instead. dnsolve has been added already to dependencies
  bool _isValidEmail(String email) {
    if (!email.contains('@')) return false;

    final emailParts = email.split('@');
    if (emailParts.length != 2) return false;

    final domain = emailParts[1];
    final validDomains = [
      'gmail.com',
      'yahoo.com',
      'hotmail.com',
      'outlook.com',
      'icloud.com',
      'aol.com',
      'protonmail.com',
      'zoho.com',
      'gmx.com',
      'mail.com',
      'yandex.com',
      'tutanota.com',
      'fastmail.com',
      'hushmail.com',
      'mail.ru',
      '163.com',
      'qq.com',
    ];

    return validDomains.contains(domain);
  }

  bool _isValidUsername(String username) {
    if (username.length < 3) return false;
    if (username.length > 20) return false;
    return RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username);
  }

  String? _validatePassword(String password) {
    if (password.length < 6) {
      return 'Password must be 6 characters long!';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must have at least a capitol letter';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain a number';
    }
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must have a special character';
    }
    return null;
  }

  Future<void> handleCreateAccount(BuildContext context) async {
    if (!_isValidEmail(state.emailController.text)) {
      _showErrorMessage(context, 'Email not valid');
      return;
    }

    if (!_isValidUsername(state.usernameController.text)) {
      _showErrorMessage(context, 'Username must be 3-20 characters long and contain only letters, numbers, and underscores');
      return;
    }

    final passwordError = _validatePassword(state.passwordController.text);
    if (passwordError != null) {
      _showErrorMessage(context, passwordError);
      return;
    }

    // TODO: Implement account creation logic here

    if (context.mounted) {
      Navigator.of(context).push(
        TurnPageRoute(
          overleafColor: AppColors.secondaryFixedDim,
          animationTransitionPoint: 0.5,
          transitionDuration: const Duration(milliseconds: 800),
          builder: (context) => const RoleSelectionScreen(),
        ),
      );
    }
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
