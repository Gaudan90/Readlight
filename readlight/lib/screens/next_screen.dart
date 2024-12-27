import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../theme/app_colors.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});
//l'ho fattu puramente per vedere se funzionava con questa specifica
  @override
  Widget build(BuildContext context) {
    // Naviga a LoginScreen dopo 5 secondi
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });

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
