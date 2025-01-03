import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

import '../screens/homepage_screen.dart';
import '../theme/app_colors.dart';

class SocialLoginBarController {
  void onFacebookTap(BuildContext context) {
    _navigateToHome(context);
  }

  void onGoogleTap(BuildContext context) {
    _navigateToHome(context);
  }

  void onAppleTap(BuildContext context) {
    _navigateToHome(context);
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).push(
      TurnPageRoute(
        overleafColor: AppColors.secondaryFixedDim,
        animationTransitionPoint: 0.5,
        transitionDuration: const Duration(milliseconds: 800),
        builder: (context) => const HomePageScreen(),
      ),
    );
  }
}
