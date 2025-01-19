import 'package:flutter/material.dart';

import '../screens/main_page_screen.dart';
import 'custom_navigation_state.dart';

class SurveyScreenState {
  // Private fields
  int? _selectedOption;
  final Map<int, String> _percentages = {
    1: '20%',
    2: '45%',
    3: '35%',
  };

  // Public getters
  int? get selectedOption => _selectedOption;
  Map<int, String> get percentages => _percentages;

  // Setter for selectedOption
  set selectedOption(int? value) {
    _selectedOption = value;
  }

  String getOptionText(int option) {
    switch (option) {
      case 1:
        return 'Kindly proceed with an entirely new narrative${_selectedOption == 1 ? ' (${_percentages[1]})' : ''}';
      case 2:
        return 'I would be grateful to experience the preceding narrative${_selectedOption == 2 ? ' (${_percentages[2]})' : ''}';
      case 3:
        return 'I would appreciate reading the subsequent narrative${_selectedOption == 3 ? ' (${_percentages[3]})' : ''}';
      default:
        return '';
    }
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
