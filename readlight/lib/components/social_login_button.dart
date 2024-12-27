import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      color: AppColors.secondaryFixedDim,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: IconButton(
              onPressed: () {
                // https://pub.dev/packages/google_sign_in/example
              },
              icon: SvgPicture.asset('assets/google.png'),
              iconSize: 60,
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: IconButton(
              onPressed: () {
                // https://pub.dev/packages/flutter_facebook_auth
              },
              icon: SvgPicture.asset('assets/facebook.png'),
              iconSize: 60,
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: IconButton(
              onPressed: () {
                // https://pub.dev/packages/insta_login
              },
              icon: SvgPicture.asset('assets/instagram.png'),
              iconSize: 60,
            ),
          ),
        ],
      ),
    );
  }
}
