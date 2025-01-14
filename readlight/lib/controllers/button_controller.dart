import 'package:flutter/material.dart';

class CustomButtonController {
  final AnimationController animationController;

  CustomButtonController(this.animationController);

  void onTapDown(TapDownDetails details) {
    animationController.forward();
  }

  void onTapUp(TapUpDetails details) {
    animationController.reverse();
  }

  void onTapCancel() {
    animationController.reverse();
  }
}
