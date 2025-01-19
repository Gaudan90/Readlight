import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readlight/widgets/back_button.dart';
import '../theme/app_colors.dart';

class NavigationItem {
  final String label;
  final IconData icon;
  final Widget screen;

  NavigationItem({
    required this.label,
    required this.icon,
    required this.screen,
  });
}

class CustomNavigationBar extends StatelessWidget {
  final List<NavigationItem> items;

  const CustomNavigationBar({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightBeige,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items
            .map(
              (item) => IconButton(
                icon: Icon(item.icon),
                onPressed: () {
                  // Handle navigation
                },
                tooltip: item.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

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
        return 'Kindly proceed with an entirely new narrative${_selectedOption == 1 ? ' (${_percentages[1]})' : ''}';
      case 2:
        return 'I would be grateful to experience the preceding narrative${_selectedOption == 2 ? ' (${_percentages[2]})' : ''}';
      case 3:
        return 'I would appreciate reading the subsequent narrative${_selectedOption == 3 ? ' (${_percentages[3]})' : ''}';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigationItems = [
      NavigationItem(
        label: 'Home',
        icon: Icons.home_outlined,
        screen: const Center(child: Text('Home Screen')),
      ),
      NavigationItem(
        label: 'Profile',
        icon: Icons.person_outline,
        screen: const Center(child: Text('Profile Screen')),
      ),
      NavigationItem(
        label: 'Settings',
        icon: Icons.settings_outlined,
        screen: const Center(child: Text('Settings Screen')),
      ),
    ];

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
                        Container(
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
                                      fillColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.selected)) {
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
                                            fontFamily: 'Formal',
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
                                            fontFamily: 'Formal',
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
                                            fontFamily: 'Formal',
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
            ),
            CustomNavigationBar(items: navigationItems),
          ],
        ),
      ),
    );
  }
}
