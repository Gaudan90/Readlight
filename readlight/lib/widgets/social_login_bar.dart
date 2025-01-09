import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/social_login_bar_controller.dart';
import '../states/social_login_bar_state.dart';

class SocialLoginBar extends StatefulWidget {
  const SocialLoginBar({super.key});

  @override
  State<SocialLoginBar> createState() => _SocialLoginBarState();
}

class _SocialLoginBarState extends State<SocialLoginBar> {
  final SocialLoginBarController _controller = SocialLoginBarController();
  late SocialLoginBarState _state;

  @override
  void initState() {
    super.initState();
    _state = SocialLoginBarState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                () => _controller.onFacebookTap(context),
                buttonSize,
              ),
              _buildSocialButton(
                'lib/assets/facebook.svg',
                () => _controller.onGoogleTap(context),
                buttonSize,
              ),
              _buildSocialButton(
                'lib/assets/instagram.svg',
                () => _controller.onAppleTap(context),
                buttonSize,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSocialButton(String assetPath, VoidCallback onTap, double size) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: SvgPicture.asset(
              assetPath,
              width: size * 0.6,
              height: size * 0.6,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
