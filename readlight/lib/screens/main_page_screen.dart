import 'package:flutter/material.dart';
import 'package:readlight/screens/homepage_screen.dart';
import 'package:readlight/screens/profile_screen.dart';
import 'package:readlight/screens/settings_screen.dart';
import '../controllers/main_page_controller.dart';
import '../states/custom_navigation_state.dart';
import '../states/main_page_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_navigation_bar.dart';
import '../theme/app_colors.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  late final MainPageState _state;
  late final MainPageController _controller;

  @override
  void initState() {
    super.initState();
    _state = MainPageState();
    _controller = MainPageController(_state, context);
    _state.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  Widget _buildSection({
    required BuildContext context,
    required String imagePath,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final imageSize = screenWidth * 0.9;

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: imageSize,
            height: screenHeight * 0.16,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        CustomButton(
          text: buttonText,
          onPressed: onTap,
          isLoginButton: true,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final navigationItems = [
      NavigationItem(
        label: 'Home',
        icon: Icons.home_outlined,
        screen: _buildMainContent(),
      ),
      NavigationItem(
        label: 'Profile',
        icon: Icons.person_outline,
        screen: const ProfileScreen(),
      ),
      NavigationItem(
        label: 'Settings',
        icon: Icons.settings_outlined,
        screen: const SettingsScreen(),
      ),
    ];
    return CustomNavigationBar(items: navigationItems);
  }

  Widget _buildMainContent() {
    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSection(
                  context: context,
                  imagePath: 'lib/assets/write_your_story.png',
                  buttonText: 'Write a Story',
                  onTap: () => _controller.onWriteStoryTapped(),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                _buildSection(
                  context: context,
                  imagePath: 'lib/assets/read_a_story.png',
                  buttonText: 'Read a Story',
                  onTap: () => _controller.onReadStoryTapped(),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                _buildSection(
                  context: context,
                  imagePath: 'lib/assets/access_community.png',
                  buttonText: 'Access Community',
                  onTap: () => _controller.onCommunityTapped(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}