import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readlight/widgets/back_button.dart';
import '../theme/app_colors.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int? _selectedOption;

  final Map<int, String> _percentages = {
    1: '20%',
    2: '45%',
    3: '35%',
  };

  String _getOptionText(int option) {
    switch (option) {
      case 1:
        return 'A new story entirely${_selectedOption == 1 ? ' (${_percentages[1]})' : ''}';
      case 2:
        return 'I would like to read the prequel${_selectedOption == 2 ? ' (${_percentages[2]})' : ''}';
      case 3:
        return 'I would like to read the sequel${_selectedOption == 3 ? ' (${_percentages[3]})' : ''}';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: Stack(
        children: [
          const BackButtonWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 144,
                  height: 144,
                  child: SvgPicture.asset(
                    'lib/assets/survey_button.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'After reading the story, what do you want to read next?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Material(
                        color: Colors.transparent,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.grey,
                            radioTheme: RadioThemeData(
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return Colors.blue;
                                  }
                                  return Colors.grey;
                                },
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              RadioListTile<int>(
                                title: Text(
                                  _getOptionText(1),
                                  style: TextStyle(
                                    color: _selectedOption == 1
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                ),
                                value: 1,
                                groupValue: _selectedOption,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedOption = value;
                                  });
                                },
                              ),
                              RadioListTile<int>(
                                title: Text(
                                  _getOptionText(2),
                                  style: TextStyle(
                                    color: _selectedOption == 2
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                ),
                                value: 2,
                                groupValue: _selectedOption,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedOption = value;
                                  });
                                },
                              ),
                              RadioListTile<int>(
                                title: Text(
                                  _getOptionText(3),
                                  style: TextStyle(
                                    color: _selectedOption == 3
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                ),
                                value: 3,
                                groupValue: _selectedOption,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedOption = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
