import 'package:flutter/material.dart';
import '../controllers/custom_checkbox_controller.dart';
import '../controllers/custom_text_field_controller.dart';
import '../states/custom_checkbox_state.dart';
import '../theme/app_colors.dart';

class LoginScreenState {
  final CustomTextFieldController emailController;
  final CustomTextFieldController passwordController;
  final CustomCheckboxState rememberMeState;

  LoginScreenState()
      : emailController = CustomTextFieldController(initiallyObscured: false),
        passwordController = CustomTextFieldController(initiallyObscured: true),
        rememberMeState = CustomCheckboxState(
          controller: CustomCheckboxController(),
          text: 'REMEMBER ME',
          textStyle: const TextStyle(
            color: AppColors.onTertiaryContainer,
          ),
        );

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}

