import 'package:flutter/material.dart';
import 'package:readlight/screens/homepage_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Navigate to HomePageScreen after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePageScreen()),
      );
    });

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.onSurfaceVariant,
      ),
      home: const HomePageScreen(),
    );
  }
}
