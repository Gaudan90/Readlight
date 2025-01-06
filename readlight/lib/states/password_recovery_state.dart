import '../controllers/custom_text_field_controller.dart';

class RecoveryPasswordState {
  final CustomTextFieldController emailController;
  final CustomTextFieldController codeController;
  final CustomTextFieldController passwordController;
  final CustomTextFieldController confirmPasswordController;

  RecoveryPasswordState()
      : emailController = CustomTextFieldController(),
        codeController = CustomTextFieldController(),
        passwordController = CustomTextFieldController(initiallyObscured: true),
        confirmPasswordController = CustomTextFieldController(initiallyObscured: true);

  void dispose() {
    emailController.dispose();
    codeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}