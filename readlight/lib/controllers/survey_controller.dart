import 'package:flutter/material.dart';

import '../states/survey_state.dart';

class SurveyScreenController extends ChangeNotifier {
  final SurveyScreenState state;

  SurveyScreenController({required this.state});

  void updateSelectedOption(int? value) {
    state.selectedOption = value;
    notifyListeners();
  }

  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
  }
}