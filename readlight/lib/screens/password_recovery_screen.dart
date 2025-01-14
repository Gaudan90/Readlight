import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/password_recovery_controller.dart';
import '../states/password_recovery_state.dart';
import '../states/custom_text_field_state.dart';
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

  Widget _buildLogoSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'lib/assets/readlight_book.svg',
          height: _state.logoSize,
          width: _state.logoSize,
        ),
        SizedBox(height: _state.spacingUnit),
        SvgPicture.asset(
          'lib/assets/readlight.svg',
          height: _state.logoSize,
          width: _state.logoSize,
        ),
      ],
    );
  }

  Widget _buildFormSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
          Text(
            'ENTER THE CODE WE SENT TO \n YOUR EMAIL',
            style: TextStyle(
              color: AppColors.onTertiaryContainer,
              fontSize: _state.textSize,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: _state.spacingUnit * 1.5),
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
          SizedBox(height: _state.spacingUnit * 2),
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
          SizedBox(height: _state.spacingUnit * 2),
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
        SizedBox(height: _state.spacingUnit * 2),
        SizedBox(
          width: _state.buttonWidth,
          child: CustomButton(
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
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (_state.isLandscape) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(flex: 1, child: _buildLogoSection()),
          Flexible(flex: 1, child: _buildFormSection()),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLogoSection(),
        SizedBox(height: _state.spacingUnit * 2),
        _buildFormSection(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _state.calculateDimensions(context);

    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: _state.horizontalPadding,
              vertical: _state.spacingUnit,
            ),
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}