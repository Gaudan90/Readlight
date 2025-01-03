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
          isLiked = !isLiked; // Cambia lo stato quando viene premuto
        });
      },
      icon: SvgPicture.asset(
        isLiked
            ? 'assets/like_button_active.svg' // Nuovo stato: versione attiva
            : 'assets/like_button.svg', // Stato iniziale: versione normale
        // ignore: deprecated_member_use
        color: isLiked ? Colors.red : null,
      ),
      iconSize: 35,
    );
  }
}
