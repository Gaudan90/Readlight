// Modified login_screen_controller.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../states/login_screen_state.dart';
import '../screens/homepage_screen.dart';
import '../theme/app_colors.dart';

class LoginScreenController extends ChangeNotifier {
  final LoginScreenState state;

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

  bool _isValidUsername(String input) {
    if (input.contains('@')) {
      return _isValidEmail(input);
    }
    return RegExp(r'^[a-zA-Z0-9_]{3,20}$').hasMatch(input);
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

  Future<void> handleLogin(BuildContext context) async {
    if (!_isValidUsername(state.emailController.text)) {
      _showErrorMessage(context, 'Invalid email or username');
      return;
    }

    final passwordError = _validatePassword(state.passwordController.text);
    if (passwordError != null) {
      _showErrorMessage(context, passwordError);
      return;
    }

    await _saveCredentials();

    if (context.mounted) {
      Navigator.of(context).push(
        TurnPageRoute(
          overleafColor: AppColors.secondaryFixedDim,
          animationTransitionPoint: 0.5,
          transitionDuration: const Duration(milliseconds: 800),
          builder: (context) => const HomePageScreen(),
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
    state.emailController.dispose();
    state.passwordController.dispose();
    super.dispose();
  }
}