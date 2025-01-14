import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../controllers/no_save_screen_controller.dart';
import '../states/no_save_screen_state.dart';
import '../widgets/custom_button.dart';

class NoSaveScreen extends StatefulWidget {
  const NoSaveScreen({super.key});

  @override
  State<NoSaveScreen> createState() => _NoSaveScreenState();
}

class _NoSaveScreenState extends State<NoSaveScreen> {
  late final NoSaveScreenState _state;
  late final NoSaveScreenController _controller;

  @override
  void initState() {
    super.initState();
    _state = NoSaveScreenState();
    _controller = NoSaveScreenController(state: _state);
  }

  Widget _buildWarningSection() {
    return Column(
      children: [
        SvgPicture.asset(
          'lib/assets/warning.svg',
          height: _state.alertImageSize,
          width: _state.alertImageSize,
          fit: BoxFit.contain,
        ),
        SizedBox(height: _state.spacingUnit * 0.75),
        Text(
          'ARE YOU SURE?',
          style: TextStyle(
            fontSize: _state.primaryTextSize,
            fontWeight: FontWeight.bold,
            color: AppColors.onTertiaryContainer,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: _state.spacingUnit * 0.5),
        Text(
          'IF YOU DO THIS YOU\'LL RISK TO\nLOSE ALL OF YOUR DATA.',
          style: TextStyle(
            fontSize: _state.secondaryTextSize,
            color: AppColors.onTertiaryContainer,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(height: _state.textButtonSpacing),
        SizedBox(
          width: _state.buttonWidth,
          child: CustomButton(
            text: 'YES, \nI Don\'t Mind',
            onPressed: () => _controller.handleContinue(context),
            backgroundColor: AppColors.secondaryFixedDim,
          ),
        ),
        SizedBox(height: _state.buttonSpacing),
        SizedBox(
          width: _state.buttonWidth,
          child: CustomButton(
            text: 'NO, \nI\'ll Login',
            onPressed: () => _controller.handleNavigation(context),
            isLoginButton: true,
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    final logoSection = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'lib/assets/readlight_book.svg',
          height: _state.logoSize,
          width: _state.logoSize,
          fit: BoxFit.contain,
        ),
        SvgPicture.asset(
          'lib/assets/readlight.svg',
          height: _state.logoSize,
          width: _state.logoSize,
          fit: BoxFit.contain,
        ),
      ],
    );

    final contentSection = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: _state.spacingUnit * 0.75),
        _buildWarningSection(),
        SizedBox(height: _state.spacingUnit * 0.75),
        _buildActionButtons(),
      ],
    );

    if (_state.isLandscape) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(flex: 1, child: logoSection),
          Flexible(flex: 1, child: contentSection),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        logoSection,
        contentSection,
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
