import 'package:flutter/material.dart';
import 'package:readlight/screens/homepage_screen.dart';
import '../states/password_recovery_state.dart';
import '../utilities/navigation_helper.dart';

class RecoveryPasswordController extends ChangeNotifier {
  final RecoveryPasswordState state;

  RecoveryPasswordController({
    required this.state,
  });

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

  Future<bool> handleSendCode(BuildContext context) async {
    if (!_isValidEmail(state.emailController.text)) {
      _showErrorMessage(context, 'Insert a valid address');
      return false;
    }

    // TODO: Add sending code logic here
    return true;
  }

  bool _isValidCode(String code) {
    return code.length == 8 && RegExp(r'^[0-9]+$').hasMatch(code);
  }

  String? _validatePassword(String password) {
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must have at least a capitol letter';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must have at least a number';
    }
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must have at least a special character';
    }
    return null;
  }

  Future<void> handlePasswordReset(BuildContext context) async {
    if (!_isValidCode(state.codeController.text)) {
      _showErrorMessage(context, 'Code must be 8 characters long');
      return;
    }

    final passwordError = _validatePassword(state.passwordController.text);
    if (passwordError != null) {
      _showErrorMessage(context, passwordError);
      return;
    }

    if (state.passwordController.text != state.confirmPasswordController.text) {
      _showErrorMessage(context, 'Password do not match');
      return;
    }

    if (context.mounted) {
      NavigationHelper.turnPageNavigate(
        context: context,
        page: const HomePageScreen(),
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