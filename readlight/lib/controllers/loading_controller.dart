import 'package:flutter/material.dart';

class LoadingController extends ChangeNotifier {
  late AnimationController animationController;
  late Animation<double> animation;
  VoidCallback? onLoadingComplete;

  void initializeAnimation(TickerProvider vsync, Duration duration, VoidCallback? onComplete) {
    onLoadingComplete = onComplete;

    animationController = AnimationController(
      duration: duration,
      vsync: vsync,
    );

    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ))..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onLoadingComplete?.call();
      }
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}