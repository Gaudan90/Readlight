import '../controllers/custom_checkbox_controller.dart';
import '../controllers/custom_text_field_controller.dart';
import '../states/custom_checkbox_state.dart';

class LoginScreenState {
  final CustomTextFieldController emailController;
  final CustomTextFieldController passwordController;
  final CustomCheckboxState rememberMeState;

  LoginScreenState()
      : emailController = CustomTextFieldController(),
        passwordController = CustomTextFieldController(initiallyObscured: true),
        rememberMeState = CustomCheckboxState(
          controller: CustomCheckboxController(),
          text: 'Remember me',
        );

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}

