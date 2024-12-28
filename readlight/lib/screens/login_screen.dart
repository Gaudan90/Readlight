import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.onSurfaceVariant,
      ),
      body: const Center(
        child: Text(
          'login completato',
          style: TextStyle(color: AppColors.onTertiaryContainer),
        ),
      ),
    );
  }
}
