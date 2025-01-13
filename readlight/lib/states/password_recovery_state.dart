import 'package:flutter/cupertino.dart';
import '../controllers/custom_text_field_controller.dart';

class RecoveryPasswordState {
  final CustomTextFieldController emailController;
  final CustomTextFieldController codeController;
  final CustomTextFieldController passwordController;
  final CustomTextFieldController confirmPasswordController;

  static const double baseWidth = 196.0;
  static const double baseHeight = 397.0;
  static const double baseAspectRatio = baseHeight / baseWidth;

  // these are the responsive properties, in case it wasn't clear!
  late double screenWidth;
  late double screenHeight;
  late double horizontalPadding;
  late double spacingUnit;
  late double logoSize;
  late double buttonWidth;
  late double textSize;
  late bool isLandscape;

  RecoveryPasswordState()
      : emailController = CustomTextFieldController
    (initiallyObscured: false),
        codeController = CustomTextFieldController
          (initiallyObscured: false),
        passwordController = CustomTextFieldController
          (initiallyObscured: true),
        confirmPasswordController = CustomTextFieldController
          (initiallyObscured: true);

  void calculateDimensions(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    isLandscape = mediaQuery.orientation == Orientation.landscape;

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
    buttonWidth = screenWidth * 0.7;
    textSize = screenWidth * 0.06;
  }

  void _adjustDimensionsForOrientation() {
    if (isLandscape) {
      logoSize *= 0.8;
      buttonWidth *= 0.8;
      spacingUnit *= 1.3;
    }
  }

  void dispose() {
    emailController.dispose();
    codeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}