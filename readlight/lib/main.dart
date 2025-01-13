import 'package:flutter/material.dart';
import 'package:readlight/screens/loading_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.onSurfaceVariant,
      ),
      home: const LoadingScreen(),
    );
  }
}
