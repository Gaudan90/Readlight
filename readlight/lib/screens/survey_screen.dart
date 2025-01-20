import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/survey_controller.dart';
import '../states/survey_state.dart';
import '../widgets/back_button.dart';
import '../theme/app_colors.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  late final SurveyScreenState _state;
  late final SurveyScreenController _controller;

  @override
  void initState() {
    super.initState();
    _state = SurveyScreenState();
    _controller = SurveyScreenController(state: _state);
  }

  Widget _buildNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.secondaryFixedDim,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _controller.navigationItems.map((item) => GestureDetector(
              onTap: () => _controller.navigateToScreen(context, item.screen),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.icon,
                    color: AppColors.onTertiaryContainer,
                    size: 24,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    style: const TextStyle(
                      color: AppColors.onTertiaryContainer,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildSurveyContent() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppColors.lightBeige,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'AFTER READING THE STORY, WHAT DO YOU WANT TO READ NEXT?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Formal',
              fontSize: 30,
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
              child: ListenableBuilder(
                listenable: _controller,
                builder: (context, _) {
                  return Column(
                    children: [1, 2, 3].map((option) => RadioListTile<int>(
                      title: Text(
                        _state.getOptionText(option),
                        style: TextStyle(
                          fontFamily: 'Formal',
                          color: _state.selectedOption == option
                              ? Colors.blue
                              : Colors.black,
                        ),
                      ),
                      value: option,
                      groupValue: _state.selectedOption,
                      onChanged: _controller.updateSelectedOption,
                    )).toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  const BackButtonWidget(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: SvgPicture.asset(
                            'lib/assets/survey_button.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 40),
                        _buildSurveyContent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildNavigationBar(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}