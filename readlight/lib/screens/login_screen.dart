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
import '../widgets/social_login_bar.dart';

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    const SizedBox(height: 45),
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
                    const SizedBox(height: 30),
                    CustomTextField(
                      state: CustomTextFieldState(
                        controller: _state.passwordController,
                        label: 'Password',
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //TODO: Add logic here to recover password
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.onTertiaryContainer,
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'I FORGOT MY PASSWORD!',
                        style: TextStyle(
                          color: AppColors.onTertiaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 45),
                    CustomButton(
                      text: 'Login',
                      onPressed: () => _controller.handleLogin(context),
                      isLoginButton: true,
                    ),
                    const SizedBox(height: 30),
                    CustomCheckbox(
                      state: _state.rememberMeState,
                    ),
                    const SizedBox(height: 30),
                    const SocialLoginBar(),
                  ],
                ),
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
