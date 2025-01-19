import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readlight/screens/profile_screen.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../screens/main_page_screen.dart';
import '../states/daily_quote_state.dart';
import '../theme/app_colors.dart';

class DailyQuoteController {
  final WidgetRef ref;

  DailyQuoteController(this.ref);

  Future<void> loadDailyQuote() async {
    final notifier = ref.read(dailyQuoteProvider.notifier);
    await notifier.fetchDailyQuote();
  }

  void navigateToNext(BuildContext context) {
    Navigator.of(context).push(
      TurnPageRoute(
        overleafColor: AppColors.secondaryFixedDim,
        animationTransitionPoint: 0.5,
        transitionDuration: const Duration(milliseconds: 800),
        builder: (context) => const ProfileScreen(),
      ),
    );
  }
}
