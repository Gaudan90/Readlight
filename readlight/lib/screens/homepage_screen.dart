import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:readlight/screens/video_screen.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_button.dart';
import 'login_screen.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
       body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animazione per immagine SVG 1
                ZoomIn(
                  duration: const Duration(seconds: 4),
                  child: SvgPicture.asset(
                    'lib/assets/readlight_book.svg',
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(height: 45),
                // Animazione per immagine SVG 2
                ZoomIn(
                  duration: const Duration(seconds: 8),
                  child: SvgPicture.asset(
                    'lib/assets/readlight.svg',
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(height: 45),
                // Animazione per Button 1
                ZoomIn(
                  duration: const Duration(seconds: 12),
                  child: CustomButton(
                    text: 'LOGIN',
                    isLoginButton: true,
                    onPressed: () {
                      Navigator.of(context).push(
                        TurnPageRoute(
                          overleafColor: AppColors.secondaryFixedDim,
                          animationTransitionPoint: 0.5,
                          transitionDuration: const Duration(milliseconds: 800),
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 45),
                // Animazione per Button 2
                ZoomIn(
                  duration: const Duration(seconds: 16),
                  child: CustomButton(
                    text: 'CONTINUE Without Account',
                    onPressed: () {
                      Navigator.of(context).push(
                        TurnPageRoute(
                          overleafColor: AppColors.secondaryFixedDim,
                          animationTransitionPoint: 0.5,
                          transitionDuration: const Duration(milliseconds: 800),
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 45),
                // Animazione per Button 3
                ZoomIn(
                  duration: const Duration(seconds: 20),
                  child: CustomButton(
                    text: 'CREATE NOW Your Account',
                    onPressed: () {
                    },
                  ),
                ),
                const SizedBox(height: 45),
                ZoomIn(
                  duration: const Duration(seconds: 24),
                  child: CustomButton(
                    text: 'WATCH VIDEO Tutorial',
                    onPressed: () {
                      Navigator.of(context).push(
                      TurnPageRoute(
                        overleafColor: AppColors.secondaryFixedDim,
                        animationTransitionPoint: 0.5,
                        transitionDuration: const Duration(milliseconds: 800),
                        builder: (context) => const VideoScreen(),
                      ),
                    );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

