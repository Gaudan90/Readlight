import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../states/custom_text_field_state.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_button.dart';
import '../widgets/back_button.dart';
import '../controllers/login_screen_controller.dart';
import '../states/login_screen_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginScreenState _state;
  late final LoginScreenController _controller;

  @override
  void initState() {
    super.initState();
    _state = LoginScreenState();
    _controller = LoginScreenController(state: _state);
    _controller.initializeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: Stack(
        children: [
          const BackButtonWidget(),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'lib/assets/readlight_book.svg',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 45),
                  SvgPicture.asset(
                    'lib/assets/readlight.svg',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    state: CustomTextFieldState(
                      controller: _state.emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    state: CustomTextFieldState(
                      controller: _state.passwordController,
                      label: 'Password',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'Login',
                    onPressed: () => _controller.handleLogin(context),
                    isLoginButton: true,
                  ),
                  const SizedBox(height: 20),
                  CustomCheckbox(
                    state: _state.rememberMeState,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}