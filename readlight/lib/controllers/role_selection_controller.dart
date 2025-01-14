import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../screens/genre_selection_screen.dart';
import '../states/role_selection_state.dart';
import '../theme/app_colors.dart';

class RoleSelectionController extends ChangeNotifier {
  final RoleSelectionState state;

  RoleSelectionController({required this.state});

  // Dimension getters
  double getPadding(BuildContext context) {
    _updateDimensions(context);
    return state.horizontalPadding;
  }

  double getSpacing(BuildContext context) {
    _updateDimensions(context);
    return state.spacingUnit;
  }

  double getLogoSize(BuildContext context) {
    _updateDimensions(context);
    return state.logoSize;
  }

  double getRoleImageSize(BuildContext context) {
    _updateDimensions(context);
    return state.roleImageSize;
  }

  double getButtonWidth(BuildContext context) {
    _updateDimensions(context);
    return state.buttonWidth;
  }

  double getTitleSize(BuildContext context) {
    _updateDimensions(context);
    return state.titleSize;
  }

  // Event handlers
  void onReaderSelected(BuildContext context) {
    Navigator.of(context).push(
      TurnPageRoute(
        overleafColor: AppColors.secondaryFixedDim,
        animationTransitionPoint: 0.5,
        transitionDuration: const Duration(milliseconds: 800),
        builder: (context) => const GenreSelectionScreen(userRole: 'Reader'),
      ),
    );
  }

  void onWriterSelected(BuildContext context) {
    Navigator.of(context).push(
      TurnPageRoute(
        overleafColor: AppColors.secondaryFixedDim,
        animationTransitionPoint: 0.5,
        transitionDuration: const Duration(milliseconds: 800),
        builder: (context) => const GenreSelectionScreen(userRole: 'Writer'),
      ),
    );
  }

  // Private helpers
  void _updateDimensions(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    state.updateDimensions(
      width: mediaQuery.size.width,
      height: mediaQuery.size.height,
      isLandscape: mediaQuery.orientation == Orientation.landscape,
    );
  }
}