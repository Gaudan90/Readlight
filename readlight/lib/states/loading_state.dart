import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LoadingState {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final Duration animationDuration;

  const LoadingState({
    this.width = 268.0,
    this.height = 8.0,
    this.backgroundColor = AppColors.secondaryBackground,
    this.progressColor = AppColors.tertiaryContainer,
    this.animationDuration = const Duration(seconds: 3),
  });
}