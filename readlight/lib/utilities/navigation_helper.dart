import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../theme/app_colors.dart';

class NavigationHelper {
  static Future<T?> turnPageNavigate<T>({
    required BuildContext context,
    required Widget page,
  }) {
    return Navigator.of(context).push(
      TurnPageRoute(
        overleafColor: AppColors.secondaryFixedDim,
        animationTransitionPoint: 0.5,
        transitionDuration: const Duration(milliseconds: 800),
        builder: (context) => page,
      ),
    );
  }
}

/* To use this, do it like this!!

 NavigationHelper.turnPageNavigate(
   context: context,
   page: const NextScreen(),
 );

 */