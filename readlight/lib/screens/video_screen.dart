import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_button.dart';
import '../controllers/video_screen_controller.dart';
import '../states/video_screen_state.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late final VideoScreenState _state;
  late final VideoScreenController _controller;

  @override
  void initState() {
    super.initState();
    _state = VideoScreenState();
    _controller = VideoScreenController(state: _state);
  }

  Widget _buildLogoSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'lib/assets/readlight_book.svg',
          height: _state.logoSize,
          width: _state.logoSize,
          fit: BoxFit.contain,
        ),
        SizedBox(height: _state.spacingUnit),
        SvgPicture.asset(
          'lib/assets/readlight.svg',
          height: _state.logoSize,
          width: _state.logoSize,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget _buildContentSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: _state.videoWidth,
          height: _state.videoHeight,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: YoutubePlayer(
            controller: _state.youtubeController,
            showVideoProgressIndicator: true,
            progressColors: const ProgressBarColors(
              playedColor: AppColors.onTertiaryContainer,
              handleColor: AppColors.onTertiaryContainer,
            ),
            aspectRatio: VideoScreenState.videoAspectRatio,
          ),
        ),
        SizedBox(height: _state.spacingUnit),
        SizedBox(
          width: _state.buttonWidth,
          child: CustomButton(
            text: 'BACK',
            onPressed: () => _controller.handleNavigation(context),
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
          Flexible(
            flex: 1,
            child: _buildLogoSection(),
          ),
          Flexible(
            flex: 1,
            child: _buildContentSection(),
          ),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLogoSection(),
        SizedBox(height: _state.spacingUnit),
        _buildContentSection(),
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

