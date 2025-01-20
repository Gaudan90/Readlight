import 'package:flutter/material.dart';

class SettingsScreenState {
  late double screenWidth;
  late double screenHeight;
  late double horizontalPadding;
  late double buttonSpacing;
  late double iconSize;
  late double fontSize;

  // Default values
  int creditsBalance = 0;
  int unblockerCount = 5;
  double currentFontSize = 24;

  void calculateDimensions(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;

    horizontalPadding = screenWidth * 0.1;
    buttonSpacing = screenHeight * 0.02;
    iconSize = screenWidth * 0.08;
    fontSize = screenWidth * 0.04;
  }

  void dispose() {
    // TODO: Add cleanup
  }
}