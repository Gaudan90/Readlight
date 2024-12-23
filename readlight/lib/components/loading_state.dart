import 'package:flutter/material.dart';

class LoadingState {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final Duration animationDuration;

  const LoadingState({
    this.width = 268.0,
    this.height = 8.0,
    this.backgroundColor = const Color(0xFF4E4D4D),
    this.progressColor = const Color(0xFFEAE5AB),
    this.animationDuration = const Duration(seconds: 2),
  });
}