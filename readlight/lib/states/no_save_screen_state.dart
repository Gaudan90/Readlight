import 'package:flutter/material.dart';

class NoSaveScreenState {
  static const double baseWidth = 196.0;
  static const double baseHeight = 397.0;
  static const double baseAspectRatio = baseHeight / baseWidth;

  late double screenWidth;
  late double screenHeight;
  late double horizontalPadding;
  late double spacingUnit;
  late double logoSize;
  late double alertImageSize;
  late double buttonWidth;
  late double primaryTextSize;
  late double secondaryTextSize;
  late double buttonSpacing;
  late double textButtonSpacing;
  late bool isLandscape;

  NoSaveScreenState();

  void calculateDimensions(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    // Determine screen orientation based on MediaQuery
    isLandscape = mediaQuery.orientation == Orientation.landscape;

    // Get actual screen dimensions
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;

    _adjustDimensionsForScreenSize();
    _adjustDimensionsForOrientation();
  }

  void _adjustDimensionsForScreenSize() {
    if (screenWidth >= 1024) {
      screenWidth = baseWidth;
      screenHeight = baseHeight;
    } else if (screenWidth >= 768) {
      screenWidth = screenWidth * 0.4;
      screenHeight = screenWidth * baseAspectRatio;
    } else {
      screenWidth = screenWidth * 0.85;
      screenHeight = screenWidth * baseAspectRatio;
    }

    _calculateBaseDimensions();
  }

  void _calculateBaseDimensions() {
    horizontalPadding = screenWidth * 0.05;
    spacingUnit = screenHeight * 0.02;
    logoSize = screenWidth * 0.4;
    alertImageSize = screenWidth * 0.2;
    buttonWidth = screenWidth * 0.7;
    primaryTextSize = screenWidth * 0.12;
    secondaryTextSize = screenWidth * 0.06;
    buttonSpacing = screenHeight * 0.05;
    textButtonSpacing = screenHeight * 0.06;
  }

  void _adjustDimensionsForOrientation() {
    if (isLandscape) {
      logoSize *= 0.8;
      primaryTextSize *= 0.8;
      secondaryTextSize *= 0.8;
      buttonWidth *= 0.8;
      spacingUnit *= 0.8;
    }
  }

  void dispose() {
    // Add any cleanup here if needed
  }
}