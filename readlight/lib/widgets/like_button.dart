import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({super.key});

  @override
  State<LikeButtonWidget> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButtonWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isLiked = !isLiked; // Toggle the state when pressed
        });
      },
      icon: SvgPicture.asset(
        isLiked
            ? 'lib/assets/like_button_active.svg'
            : 'lib/assets/like_button.svg',
        // ignore: deprecated_member_use
        color: isLiked ? Colors.red : null,
      ),
      iconSize: 35,
    );
  }
}
