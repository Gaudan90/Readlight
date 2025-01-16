import 'package:flutter/material.dart';
import '../controllers/custom_navigation_controller.dart';
import '../states/custom_navigation_state.dart';
import '../theme/app_colors.dart';

class CustomNavigationBar extends StatefulWidget {
  final List<NavigationItem> items;

  const CustomNavigationBar({
    super.key,
    required this.items,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late final CustomNavigationState _state;
  late final CustomNavigationController _controller;

  @override
  void initState() {
    super.initState();
    _state = CustomNavigationState();
    _controller = CustomNavigationController(_state);
    _state.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.items[_state.selectedIndex].screen,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryFixedDim,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                widget.items.length,
                    (index) => _buildNavigationItem(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationItem(int index) {
    final item = widget.items[index];
    final isSelected = _state.selectedIndex == index;

    return GestureDetector(
      onTap: () => _controller.onItemSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            item.icon,
            color: isSelected
                ? AppColors.checkedBox
                : AppColors.onTertiaryContainer,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            item.label,
            style: TextStyle(
              color: isSelected
                  ? AppColors.checkedBox
                  : AppColors.onTertiaryContainer,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

/*
Samples on how to use the custom navigation bar in different screens:

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

    return MaterialApp(
      home: CustomNavigationBar(items: navigationItems),
    );
  }

*/