import 'package:flutter/material.dart';
import '../controllers/custom_checkbox_controller.dart';
import '../controllers/custom_text_field_controller.dart';
import '../states/custom_checkbox_state.dart';
import '../theme/app_colors.dart';

class CreateAccountScreenState {
  final CustomTextFieldController emailController;
  final CustomTextFieldController usernameController;
  final CustomTextFieldController passwordController;
  final CustomCheckboxState newsletterState;

  CreateAccountScreenState()
      : emailController = CustomTextFieldController(initiallyObscured: false),
        usernameController = CustomTextFieldController(initiallyObscured: false),
        passwordController = CustomTextFieldController(initiallyObscured: true),
        newsletterState = CustomCheckboxState(
          controller: CustomCheckboxController(),
          text: 'SUBSCRIBE TO NEWSLETTERS',
          textStyle: const TextStyle(
            color: AppColors.onTertiaryContainer,
          ),
        );

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }
}