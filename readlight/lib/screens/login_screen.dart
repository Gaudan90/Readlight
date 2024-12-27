import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_button.dart';
import 'next_screen_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
       body: Center(
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
              const SizedBox(height: 20),
              // Animazione per immagine SVG 2
              ZoomIn(
                duration: const Duration(seconds: 8),
                child: SvgPicture.asset(
                  'lib/assets/readlight.svg',
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(height: 20),
              // Animazione per Button 1
              ZoomIn(
                duration: const Duration(seconds: 12),
                child: CustomButton(
                  text: 'LOGIN',
                  isLoginButton: true,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const NextScreenLogin()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Animazione per Button 2
              ZoomIn(
                duration: const Duration(seconds: 16),
                child: CustomButton(
                  text: 'CONTINUE Without Account',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const NextScreenLogin()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Animazione per Button 3
              ZoomIn(
                duration: const Duration(seconds: 20),
                child: CustomButton(
                  text: 'CREATE NOW Your Account',
                  onPressed: () {
                  },
                ),
              ),
              const SizedBox(height: 20),
              ZoomIn(
                duration: const Duration(seconds: 24),
                child: CustomButton(
                  text: 'WATCH VIDEO',
                  onPressed: () {
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

