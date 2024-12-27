import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class NextScreenLogin extends StatelessWidget {
  const NextScreenLogin({super.key});

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
