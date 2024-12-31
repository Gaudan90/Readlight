import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../states/video_screen_state.dart';
import '../theme/app_colors.dart';

class VideoScreenController extends ChangeNotifier {
  final VideoScreenState state;

  VideoScreenController({
    required this.state,
  });

  void handleNavigation(BuildContext context) {
    Navigator.of(context).maybePop(TurnPageRoute(
      overleafColor: AppColors.secondaryFixedDim,
      animationTransitionPoint: 0.5,
      transitionDuration: const Duration(milliseconds: 800),
      builder: (context) => const SizedBox.shrink(),
      ),
    );
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}