import 'package:flutter/material.dart';
import '../screens/genre_selection_screen.dart';
import '../states/role_selection_state.dart';
import '../utilities/navigation_helper.dart';

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
    NavigationHelper.turnPageNavigate(
      context: context,
      page: const GenreSelectionScreen(userRole: 'Reader'),
    );
  }

  void onWriterSelected(BuildContext context) {
    NavigationHelper.turnPageNavigate(
      context: context,
      page: const GenreSelectionScreen(userRole: 'Writer'),
    );
  }

  void _updateDimensions(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    state.updateDimensions(
      width: mediaQuery.size.width,
      height: mediaQuery.size.height,
      isLandscape: mediaQuery.orientation == Orientation.landscape,
    );
  }
}