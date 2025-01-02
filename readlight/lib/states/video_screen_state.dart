import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreenState {
  final YoutubePlayerController youtubeController;

  static const double baseWidth = 196.0;
  static const double baseHeight = 397.0;
  static const double baseAspectRatio = baseHeight / baseWidth;
  static const double videoAspectRatio = 9/16;

  late double screenWidth;
  late double screenHeight;
  late double horizontalPadding;
  late double spacingUnit;
  late double logoSize;
  late double buttonWidth;
  late double videoWidth;
  late double videoHeight;
  late bool isLandscape;

  VideoScreenState()
      : youtubeController = YoutubePlayerController(
    initialVideoId: 'AfK-mI2ASJ4',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  void calculateDimensions(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    isLandscape = mediaQuery.orientation == Orientation.landscape;

    if (screenWidth >= 1024) {
      screenWidth = baseWidth;
      screenHeight = baseHeight;
    } else if (screenWidth >= 768) {
      screenWidth = screenWidth * 0.4;
      screenHeight = screenWidth * baseAspectRatio;
    } else {
      screenWidth = screenWidth * 0.85;
      screenHeight = screenWidth * baseAspectRatio;
    }

    _calculateBaseDimensions();
    _adjustDimensionsForOrientation();
  }

  void _calculateBaseDimensions() {
    videoWidth = screenWidth * 0.8;
    videoHeight = videoWidth / videoAspectRatio;
    horizontalPadding = screenWidth * 0.05;
    spacingUnit = screenHeight * 0.03;
    logoSize = screenWidth * 0.5;
    buttonWidth = screenWidth * 0.7;
  }

  void _adjustDimensionsForOrientation() {
    if (isLandscape) {
      logoSize *= 0.8;
      videoWidth *= 0.8;
      videoHeight = videoWidth / videoAspectRatio;
      buttonWidth *= 0.8;
      spacingUnit *= 0.8;
    }
  }

  void dispose() {
    youtubeController.dispose();
  }
}
