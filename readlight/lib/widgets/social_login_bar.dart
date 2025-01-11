import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/social_login_bar_controller.dart';
import '../theme/app_colors.dart';

class SocialLoginBar extends StatefulWidget {
  const SocialLoginBar({super.key});

  @override
  State<SocialLoginBar> createState() => _SocialLoginBarState();
}

class _SocialLoginBarState extends State<SocialLoginBar> {
  final SocialLoginBarController _controller = SocialLoginBarController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_controller.state.error != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              _controller.state.error!,
              style: const TextStyle(color: AppColors.errorRed, fontSize: 12),
            ),
          ),
        LayoutBuilder(
          builder: (context, constraints) {
            double availableWidth = constraints.maxWidth;
            double buttonSize = 70.0;
            double spacing = (availableWidth - (buttonSize * 3)) / 4;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSocialButton(
                    'lib/assets/google.svg',
                    'google',
                        () async => await _controller.onGoogleTap(context),
                    buttonSize,
                  ),
                  _buildSocialButton(
                    'lib/assets/facebook.svg',
                    'facebook',
                        () async => await _controller.onFacebookTap(context),
                    buttonSize,
                  ),
                  _buildSocialButton(
                    'lib/assets/instagram.svg',
                    'instagram',
                        () async => await _controller.onInstagramTap(context),
                    buttonSize,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSocialButton(
      String assetPath,
      String provider,
      Future<void> Function() onTap,
      double size
      ) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _controller.state.isLoading ? null : () {
              setState(() {});
              onTap();
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: _controller.state.isLoadingProvider(provider)
                    ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
                    : SvgPicture.asset(
                  assetPath,
                  width: size * 0.6,
                  height: size * 0.6,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
