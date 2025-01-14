import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/role_selection_controller.dart';
import '../states/role_selection_state.dart';
import '../widgets/back_button.dart';
import '../widgets/custom_button.dart';
import '../theme/app_colors.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  late final RoleSelectionState _state;
  late final RoleSelectionController _controller;

  @override
  void initState() {
    super.initState();
    _state = RoleSelectionState();
    _controller = RoleSelectionController(state: _state);
  }

  Widget _buildLogoSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'lib/assets/readlight_book.svg',
          height: _controller.getLogoSize(context),
          width: _controller.getLogoSize(context),
          fit: BoxFit.contain,
        ),
        SvgPicture.asset(
          'lib/assets/readlight.svg',
          height: _controller.getLogoSize(context),
          width: _controller.getLogoSize(context),
          fit: BoxFit.contain,
        ),
      ],
    );
  }
  Widget _buildRoleSection() {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
          if (isLandscape) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/reader.png',
                        height: _controller.getRoleImageSize(context),
                        width: _controller.getRoleImageSize(context),
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        bottom: -_controller.getSpacing(context),
                        child: SizedBox(
                          width: _controller.getButtonWidth(context),
                          child: CustomButton(
                            text: 'READER',
                            onPressed: () => _controller.onReaderSelected(context),
                            isLoginButton: true,
                            backgroundColor: AppColors.secondaryFixedDim,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/writer.png',
                        height: _controller.getRoleImageSize(context),
                        width: _controller.getRoleImageSize(context),
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        bottom: -_controller.getSpacing(context),
                        child: SizedBox(
                          width: _controller.getButtonWidth(context),
                          child: CustomButton(
                            text: 'WRITER',
                            onPressed: () => _controller.onWriterSelected(context),
                            isLoginButton: true,
                            backgroundColor: AppColors.secondaryFixedDim,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/reader.png',
                        height: _controller.getRoleImageSize(context),
                        width: _controller.getRoleImageSize(context),
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: _controller.getButtonWidth(context),
                          child: CustomButton(
                            text: 'READER',
                            onPressed: () => _controller.onReaderSelected(context),
                            isLoginButton: true,
                            backgroundColor: AppColors.secondaryFixedDim,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/writer.png',
                        height: _controller.getRoleImageSize(context),
                        width: _controller.getRoleImageSize(context),
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: _controller.getButtonWidth(context),
                          child: CustomButton(
                            text: 'WRITER',
                            onPressed: () => _controller.onWriterSelected(context),
                            isLoginButton: true,
                            backgroundColor: AppColors.secondaryFixedDim,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildContent() {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final titleWidget = Text(
      'Who Are You?',
      style: TextStyle(
        fontSize: _controller.getTitleSize(context),
        fontWeight: FontWeight.bold,
        color: AppColors.onTertiaryContainer,
      ),
      textAlign: TextAlign.center,
    );
    final mainContent = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: _controller.getSpacing(context) * 0.5),
        titleWidget,
        SizedBox(height: _controller.getSpacing(context) * 0.5),
        _buildRoleSection(),
      ],
    );
    if (isLandscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: _buildLogoSection(),
          ),
          Flexible(
            flex: 3,
            child: mainContent,
          ),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 48),
        _buildLogoSection(),
        Expanded(child: mainContent),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned(
              top: 16,
              left: 16,
              child: BackButtonWidget(),
            ),
            Padding(
              padding: EdgeInsets.all(_controller.getPadding(context)),
              child: _buildContent(),
            ),
          ],
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
