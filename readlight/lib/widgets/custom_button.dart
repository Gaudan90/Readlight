import 'package:flutter/material.dart';
import '../controllers/button_controller.dart';
import '../states/button_state.dart';
import '../theme/app_colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final bool isLoginButton;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.secondaryFixedDim,
    this.isLoginButton = false,
  });

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonView extends StatelessWidget {
  final CustomButtonState state;
  final CustomButtonController controller;
  final CustomButton widget;

  const CustomButtonView({
    super.key,
    required this.state,
    required this.controller,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: controller.onTapDown,
      onTapUp: controller.onTapUp,
      onTapCancel: controller.onTapCancel,
      child: ScaleTransition(
        scale: state.scaleAnimation,
        child: Container(
          width: MediaQuery.of(context).size.width > 600 ? 200 : 166,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.isLoginButton ? AppColors.buttonPrimary : widget.backgroundColor,
              foregroundColor: AppColors.onTertiaryContainer,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.isLoginButton ? 22 : 16,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}