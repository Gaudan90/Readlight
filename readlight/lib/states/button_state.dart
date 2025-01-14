import 'package:flutter/material.dart';
import '../controllers/button_controller.dart';
import '../widgets/custom_button.dart';

class CustomButtonState extends State<CustomButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  AnimationController get controller => _controller;
  Animation<double> get scaleAnimation => _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = CustomButtonController(_controller);
    return CustomButtonView(
      state: this,
      controller: controller,
      widget: widget,
    );
  }
}