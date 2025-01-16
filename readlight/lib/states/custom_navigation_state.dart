import 'package:flutter/material.dart';

class CustomNavigationState extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class NavigationItem {
  final String label;
  final IconData icon;
  final Widget screen;

  NavigationItem({
    required this.label,
    required this.icon,
    required this.screen,
  });
}
