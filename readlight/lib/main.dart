import 'package:flutter/material.dart';
import 'package:readlight/screens/homepage_screen.dart';
import 'package:readlight/screens/loading_screen.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
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
      Navigator.of(context).push(
        TurnPageRoute(
          overleafColor: AppColors.secondaryFixedDim,
          animationTransitionPoint: 0.5,
          transitionDuration: const Duration(milliseconds: 800),
          builder: (context) => const HomePageScreen(),
        ),
      );
    });

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.onSurfaceVariant,
      ),
      home: const LoadingScreen(),
    );
  }
}
