import '../states/custom_navigation_state.dart';

class CustomNavigationController {
  final CustomNavigationState state;

  CustomNavigationController(this.state);

  void onItemSelected(int index) {
    state.updateIndex(index);
  }
}
