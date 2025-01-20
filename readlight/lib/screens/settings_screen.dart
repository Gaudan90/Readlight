import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readlight/screens/profile_screen.dart';
import '../controllers/settings_screen_controller.dart';
import '../states/custom_navigation_state.dart';
import '../states/settings_screen_state.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_navigation_bar.dart';
import 'main_page_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final SettingsScreenState _state;
  late final SettingsScreenController _controller;

  @override
  void initState() {
    super.initState();
    _state = SettingsScreenState();
    _controller = SettingsScreenController(state: _state);
  }

  @override
  Widget build(BuildContext context) {
    _state.calculateDimensions(context);
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
      backgroundColor: AppColors.brownDark,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: paddingTop),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildInfoSection(),
                SizedBox(height: _state.buttonSpacing * 2),
                _buildBalanceSection(),
                SizedBox(height: _state.buttonSpacing * 2),
                _buildUnblockerButton(),
                SizedBox(height: _state.buttonSpacing * 2),
                _buildFontSizeSection(),
                SizedBox(height: _state.buttonSpacing * 2),
                _buildThemeSection(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _state.horizontalPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.help_outline),
                color: AppColors.lightYellow,
                onPressed: () {},
              ),
            ],
          ),
          SvgPicture.asset(
            'lib/assets/readlight_book.svg',
            height: _state.iconSize * 2,
            width: _state.iconSize * 2,
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _state.horizontalPadding),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: _state.horizontalPadding * 0.5,
              vertical: _state.buttonSpacing,
            ),
            decoration: BoxDecoration(
              color: AppColors.surfaceDim,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Credits Balance: ${_state.creditsBalance}',
                  style: TextStyle(
                    fontSize: _state.fontSize,
                    color: AppColors.brownDissolve,
                  ),
                ),
                SizedBox(width: _state.horizontalPadding * 0.2),
                Icon(
                  Icons.monetization_on,
                  size: _state.iconSize,
                  color: AppColors.oliveGreen,
                ),
              ],
            ),
          ),
          SizedBox(height: _state.buttonSpacing),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: _state.horizontalPadding * 0.5,
              vertical: _state.buttonSpacing,
            ),
            decoration: BoxDecoration(
              color: AppColors.surfaceDim,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              'Unblockers: ${_state.unblockerCount} FREE',
              style: TextStyle(
                fontSize: _state.fontSize,
                color: AppColors.brownDissolve,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnblockerButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _state.horizontalPadding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          padding: EdgeInsets.symmetric(
            horizontal: _state.horizontalPadding,
            vertical: _state.buttonSpacing * 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: _controller.handleUnblockerPress,
        child: Text(
          'USE UNBLOCKER NOW!',
          style: TextStyle(
            color: AppColors.lightYellow,
            fontSize: _state.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFontSizeSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _state.horizontalPadding),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _state.horizontalPadding * 0.5,
          vertical: _state.buttonSpacing,
        ),
        decoration: BoxDecoration(
          color: AppColors.surfaceDim,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Font Size: ${_state.currentFontSize.round()}',
              style: TextStyle(
                fontSize: _state.fontSize,
                color: AppColors.brownDissolve,
              ),
            ),
            SizedBox(width: _state.horizontalPadding * 0.5),
            Row(
              children: [
                Text(
                  'a',
                  style: TextStyle(
                    fontSize: _state.fontSize * 0.8,
                    color: AppColors.brownDissolve,
                  ),
                ),
                Text(
                  'A',
                  style: TextStyle(
                    fontSize: _state.fontSize * 1.2,
                    color: AppColors.brownDissolve,
                  ),
                ),
                Text(
                  'A',
                  style: TextStyle(
                    fontSize: _state.fontSize * 1.5,
                    color: AppColors.brownDissolve,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _state.horizontalPadding),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _state.horizontalPadding * 0.5,
          vertical: _state.buttonSpacing,
        ),
        decoration: BoxDecoration(
          color: AppColors.surfaceDim,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Themes\n(Click to change)',
              style: TextStyle(
                fontSize: _state.fontSize,
                color: AppColors.brownDissolve,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: _state.horizontalPadding * 0.5),
            Icon(
              Icons.brightness_4,
              size: _state.iconSize,
              color: AppColors.darkGrey,
            ),
            SizedBox(width: _state.buttonSpacing),
            Icon(
              Icons.brightness_5,
              size: _state.iconSize,
              color: AppColors.oliveGreen,
            ),
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