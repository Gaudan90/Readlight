import 'package:flutter/material.dart';
import '../components/loading_bar.dart';
import '../components/loading_state.dart';
import 'next_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const loadingState = LoadingState(
      width: 268,
      height: 8,
      backgroundColor: Color(0xFF4E4D4D),
      progressColor: Color(0xFFEAE5AB),
      animationDuration: Duration(seconds: 5),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Readlight'),
        backgroundColor: const Color(0xFF2D211B),
      ),
      body: Stack(
        children: [
          // Qui puoi aggiungere altri widget sopra la loading bar

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