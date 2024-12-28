import 'package:flutter/material.dart';
import '../controllers/custom_checkbox_controller.dart';

class CustomCheckboxState {
  final CustomCheckboxController controller;
  final String text;
  final Color? checkColor;
  final Color? activeColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomCheckboxState({
    required this.controller,
    required this.text,
    this.checkColor,
    this.activeColor,
    this.textStyle,
    this.padding,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });
}