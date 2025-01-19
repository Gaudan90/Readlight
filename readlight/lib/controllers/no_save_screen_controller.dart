import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../screens/daily_quote_screen.dart';
import '../states/no_save_screen_state.dart';
import '../theme/app_colors.dart';
import '../utilities/navigation_helper.dart';

class NoSaveScreenController extends ChangeNotifier {
  final NoSaveScreenState state;

  NoSaveScreenController({
    required this.state,
  });

  void handleNavigation(BuildContext context) {
    Navigator.of(context).maybePop(TurnPageRoute(
      overleafColor: AppColors.secondaryFixedDim,
      animationTransitionPoint: 0.5,
      transitionDuration: const Duration(milliseconds: 800),
      builder: (context) => const SizedBox.shrink(),
    ));
  }

  void handleContinue(BuildContext context) {
    NavigationHelper.turnPageNavigate(
      context: context,
      page: const DailyQuoteScreen(),
    );
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}
