import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/create_account_controller.dart';
import '../states/create_account_state.dart';
import '../theme/app_colors.dart';
import '../states/custom_text_field_state.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_button.dart';
import '../widgets/back_button.dart';
import '../widgets/social_login_bar.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late final CreateAccountScreenState _state;
  late final CreateAccountScreenController _controller;

  @override
  void initState() {
    super.initState();
    _state = CreateAccountScreenState();
    _controller = CreateAccountScreenController(state: _state);
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
                    const SizedBox(height: 20),
                    SvgPicture.asset(
                      'lib/assets/readlight.svg',
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(height: 20),
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
                        controller: _state.usernameController,
                        label: 'Username',
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
                    const SizedBox(height: 20),
                    CustomCheckbox(
                      state: _state.newsletterState,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'CREATE Account',
                      onPressed: () => _controller.handleCreateAccount(context),
                      isLoginButton: true,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'OR LOGIN WITH',
                      style: TextStyle(
                        color: AppColors.onTertiaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
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