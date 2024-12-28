import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 28,
      left: 28,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).maybePop(TurnPageRoute(
            overleafColor: Colors.grey,
            animationTransitionPoint: 0.5,
            transitionDuration: const Duration(milliseconds: 800),
            builder: (context) => const SizedBox.shrink(),
          ));
        },
        icon: SvgPicture.asset('lib/assets/back_button.svg'), // SVG button asset
        iconSize: 35,
      ),
    );
  }
}
