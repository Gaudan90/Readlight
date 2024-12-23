import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.onSurfaceVariant,
      ),
      body: const Center(
        child: Text(
          'Loading completato!',
          style: TextStyle(color: AppColors.onTertiaryContainer),
        ),
      ),
    );
  }
}