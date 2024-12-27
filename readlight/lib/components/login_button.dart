import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const LoginButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () => 'Login button pressed!',
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimary,
        foregroundColor: AppColors.lightBeige,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: const Text('Login'),
    );
  }
}

class PlaceholderButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const PlaceholderButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () => 'Placeholder button pressed!',
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryFixedDim,
        foregroundColor: AppColors.lightBeige,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: const Text('Continue Without Account'),
    );
  }
}
