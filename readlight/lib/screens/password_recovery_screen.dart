import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/password_recovery_controller.dart';
import '../states/custom_text_field_state.dart';
import '../states/password_recovery_state.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../theme/app_colors.dart';

class RecoveryPasswordScreen extends StatefulWidget {
  const RecoveryPasswordScreen({super.key});

  @override
  State<RecoveryPasswordScreen> createState() => _RecoveryPasswordScreenState();
}

class _RecoveryPasswordScreenState extends State<RecoveryPasswordScreen> {
  late final RecoveryPasswordState _state;
  late final RecoveryPasswordController _controller;
  bool _showRecoveryFields = false;

  @override
  void initState() {
    super.initState();
    _state = RecoveryPasswordState();
    _controller = RecoveryPasswordController(state: _state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: Stack(
        children: [
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
                    if (!_showRecoveryFields)
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
                    if (_showRecoveryFields) ...[
                      CustomTextField(
                        state: CustomTextFieldState(
                          controller: _state.codeController,
                          label: 'Recovery Code',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        state: CustomTextFieldState(
                          controller: _state.passwordController,
                          label: 'New Password',
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        state: CustomTextFieldState(
                          controller: _state.confirmPasswordController,
                          label: 'Confirm Password',
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                    const SizedBox(height: 30),
                    CustomButton(
                      text: _showRecoveryFields ? 'ACCEPT' : 'SEND CODE',
                      onPressed: () {
                        if (_showRecoveryFields) {
                          _controller.handlePasswordReset(context);
                        } else {
                          _controller.handleSendCode(context).then((success) {
                            if (success) {
                              setState(() {
                                _showRecoveryFields = true;
                              });
                            }
                          });
                        }
                      },
                      isLoginButton: true,
                    ),
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