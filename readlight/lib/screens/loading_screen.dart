import 'package:flutter/material.dart';
import '../components/loading_bar.dart';
import '../components/loading_state.dart';
import 'next_screen.dart';
import '../theme/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const loadingState = LoadingState();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Readlight'),
        backgroundColor: AppColors.onSurfaceVariant,
      ),
      body: Stack(
        children: [
          // Qui si possono aggiungere altri widget sopra la loading bar

          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: LoadingBar(
                state: loadingState,
                onLoadingComplete: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const NextScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}