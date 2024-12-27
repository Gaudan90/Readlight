import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const LoginButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () => print('Login button pressed!'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.oliveGreen,
        foregroundColor: AppColors.lightBeige,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: TextStyle(fontSize: 16),
      ),
      child: Text('Login'),
    );
  }
}

class PlaceholderButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const PlaceholderButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () => print('Placeholder button pressed!'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightBrown,
        foregroundColor: AppColors.lightBeige,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: TextStyle(fontSize: 16),
      ),
      child: Text('Continue Without Account'),
    );
  }
}
