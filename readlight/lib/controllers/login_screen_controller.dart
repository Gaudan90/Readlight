import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../states/login_screen_state.dart';
import '../screens/homepage_screen.dart';
import '../theme/app_colors.dart';

class LoginScreenController extends ChangeNotifier {
  final LoginScreenState state;
  final _supabase = Supabase.instance.client;

  LoginScreenController({
    required this.state,
  });

  Future<void> initializeController() async {
    await _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('rememberMe') ?? false) {
      state.emailController.text = prefs.getString('email') ?? '';
      state.passwordController.text = prefs.getString('password') ?? '';
      state.rememberMeState.controller.toggleCheckbox();
      notifyListeners();
    }
  }

  Future<void> _saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();

    if (state.rememberMeState.controller.isChecked) {
      await prefs.setString('email', state.emailController.text);
      await prefs.setString('password', state.passwordController.text);
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('email');
      await prefs.remove('password');
      await prefs.setBool('rememberMe', false);
    }
  }

  Future<void> handleLogin(BuildContext context) async {
    try {
      _showLoadingDialog(context);

      // Supabase login - no API required
      final response = await _supabase.auth.signInWithPassword(
        email: state.emailController.text,
        password: state.passwordController.text,
      );

      await _saveCredentials();

      if (context.mounted) {
        Navigator.of(context).pop();
      }

      // TODO: Se il login ha successo, naviga alla home page. È da cambiare presto
      if (response.user != null && context.mounted) {
        Navigator.of(context).push(
          TurnPageRoute(
            overleafColor: AppColors.secondaryFixedDim,
            animationTransitionPoint: 0.5,
            transitionDuration: const Duration(milliseconds: 800),
            builder: (context) => const HomePageScreen(),
          ),
        );
      }
    } on AuthException catch (error) {
      if (context.mounted) {
        Navigator.of(context).pop();
        _showErrorMessage(context, _getErrorMessage(error.message));
      }
    } catch (error) {
      if (context.mounted) {
        Navigator.of(context).pop();
        _showErrorMessage(context, 'An error occurred during login');
      }
    }
  }

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'Invalid login credentials':
        return 'Email or password not valid';
      case 'Email not confirmed':
        return 'Please confirm email before accessing';
      default:
        return 'An error occurred during login';
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