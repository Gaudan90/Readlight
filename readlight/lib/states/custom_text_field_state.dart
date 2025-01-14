import 'package:flutter/material.dart';
import '../controllers/custom_text_field_controller.dart';

class CustomTextFieldState {
  final CustomTextFieldController controller;
  final String label;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool obscureText;

  CustomTextFieldState({
    required this.controller,
    required this.label,
    this.keyboardType,
    this.onChanged,
    this.obscureText = false,
  });
}