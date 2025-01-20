import 'package:flutter/material.dart';
import 'package:readlight/controllers/profile_screen_controller.dart';
import 'package:readlight/screens/main_page_screen.dart';
import 'package:readlight/screens/settings_screen.dart';
import '../states/custom_navigation_state.dart';
import '../theme/app_colors.dart';
import '../data/avatar_api.dart';
import '../widgets/custom_navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileController controller;
  final AvatarService _avatarService = AvatarService();

  @override
  void initState() {
    super.initState();
    controller = ProfileController(context, setState);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    final navigationItems = [
      NavigationItem(
        label: 'Home',
        icon: Icons.home_outlined,
        screen: const MainPageScreen(),
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
    CustomNavigationBar(items: navigationItems);

    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: paddingTop),
            child: Column(
              children: [
                _buildTopIcons(),
                _buildProfileInfo(),
                _buildDescriptionBox(),
                _buildActionButtons(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              controller.state.isMusicOn ? Icons.music_note : Icons.music_off,
              size: 50,
              color: !controller.state.isMusicOn ?
              AppColors.onSecondaryContainer :
              AppColors.onTertiaryContainer,
            ),
            onPressed: controller.toggleMusic,
          ),
          const SizedBox(width: 60),
          IconButton(
            icon: const Icon(
              Icons.upload, size: 50,
              color: AppColors.lightYellow,
            ),
            onPressed: controller.pickAudioFile,
          ),
          const SizedBox(width: 60),
          IconButton(
            icon: Icon(
              !controller.state.isMusicOn ? Icons.music_note : Icons.music_off,
              size: 50,
              color: !controller.state.isMusicOn ?
              AppColors.onTertiaryContainer :
              AppColors.onSecondaryContainer,
            ),
            onPressed: controller.toggleMusic,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        const SizedBox(height: 32),
        Text(
          controller.state.aliasName,
          style: const TextStyle(
            color: AppColors.lightYellow,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 120,
          backgroundColor: Colors.transparent,
          backgroundImage:
              NetworkImage(_avatarService.getCurrentUserAvatarUrl()),
        ),
        const SizedBox(height: 20),
        Text(
          controller.state.quote,
          style: const TextStyle(
            color: AppColors.lightYellow,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDescriptionBox() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: 329,
        height: 158,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: controller.state.descriptionController,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(16),
            hintText: 'Enter your description...',
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 33),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: controller.previewProfile,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A3F35),
              foregroundColor: AppColors.lightYellow,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text('Preview'),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: controller.saveProfile,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.oliveGreen,
              foregroundColor: AppColors.lightYellow,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
