import 'package:flutter/material.dart';
import 'package:readlight/screens/homepage_screen.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../widgets/loading_bar.dart';
import '../states/loading_state.dart';
import '../theme/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const loadingState = LoadingState();

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: AppColors.onSurfaceVariant,
      ),
      body: Stack(
        children: [
          // Add more widgets above the loading bar, if needed

          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: LoadingBar(
                state: loadingState,
                onLoadingComplete: () {
                  Navigator.of(context).push(
                    TurnPageRoute(
                      overleafColor: AppColors.secondaryFixedDim,
                      animationTransitionPoint: 0.5,
                      transitionDuration: const Duration(milliseconds: 800),
                      builder: (context) => const HomePageScreen(),
                    ),
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