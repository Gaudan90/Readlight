import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/survey_screen.dart';

class SurveyButtonWidget extends StatelessWidget {
  const SurveyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SurveyScreen()),
        );
      },
      icon: SvgPicture.asset(
        'lib/assets/survey_button.svg',
        width: 24,
        height: 24,
      ),
    );
  }
}
