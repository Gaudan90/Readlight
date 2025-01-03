import 'package:flutter/material.dart';
import 'package:readlight/widgets/survey_button.dart';
import '../theme/app_colors.dart';
import '../widgets/back_button.dart';
import '../widgets/survey_button.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int? _selectedOption; // Variabile per gestire la selezione

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
                Transform.scale(
                  scale: 3.0,
                  child: const SurveyButtonWidget(),
                ),
                const SizedBox(
                    height: 40), // Spazio tra il bottone e il contenuto
                Container(
                  padding: const EdgeInsets.all(16.0),
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
                      // Opzione 1
                      RadioListTile<int>(
                        title: const Text('A new story entirely (20%)'),
                        value: 1,
                        groupValue: _selectedOption,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      ),
                      // Opzione 2
                      RadioListTile<int>(
                        title: const Text('I’d like to read the prequel (45%)'),
                        value: 2,
                        groupValue: _selectedOption,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      ),
                      // Opzione 3
                      RadioListTile<int>(
                        title: const Text('I’d like to read the sequel (35%)'),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
