import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../states/login_screen_state.dart';
import '../screens/homepage_screen.dart';

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
      // Add more here if necessary
    ];

    return validDomains.contains(domain);
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
    if (!_isValidEmail(state.emailController.text)) {
      _showErrorMessage(context, 'Email not valid');
      return;
    }

    final passwordError = _validatePassword(state.passwordController.text);
    if (passwordError != null) {
      _showErrorMessage(context, passwordError);
      return;
    }

    await _saveCredentials();

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePageScreen()),
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