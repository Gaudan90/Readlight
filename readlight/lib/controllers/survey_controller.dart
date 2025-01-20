import 'package:flutter/material.dart';
import '../screens/main_page_screen.dart';
import '../states/custom_navigation_state.dart';
import '../states/survey_state.dart';

class SurveyScreenController extends ChangeNotifier {
  final SurveyScreenState state;

  SurveyScreenController({required this.state});

  void updateSelectedOption(int? value) {
    state.selectedOption = value;
    notifyListeners();
  }

  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
  }

  List<NavigationItem> get navigationItems => [
    NavigationItem(
      label: 'Home',
      icon: Icons.home_outlined,
      screen: const MainPageScreen(),
    ),
    NavigationItem(
      label: 'Profile',
      icon: Icons.person_outline,
      screen: const Center(child: Text('Profile Screen')),
    ),
    NavigationItem(
      label: 'Settings',
      icon: Icons.settings_outlined,
      screen: const Center(child: Text('Settings Screen')),
    ),
  ];
}
