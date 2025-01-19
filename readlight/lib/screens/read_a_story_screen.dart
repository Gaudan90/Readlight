import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readlight/screens/main_page_screen.dart';
import '../controllers/read_a_story_controller.dart';
import '../states/custom_navigation_state.dart';
import '../states/read_a_story_state.dart';
import '../widgets/custom_text_field.dart';
import '../theme/app_colors.dart';
import 'new_story_screen.dart';

class ReadAStoryScreen extends StatefulWidget {
  const ReadAStoryScreen({super.key});

  @override
  State<ReadAStoryScreen> createState() => _ReadAStoryScreenState();
}

class _ReadAStoryScreenState extends State<ReadAStoryScreen> {
  late final ReadAStoryScreenState _state;
  late final ReadAStoryScreenController _controller;

  @override
  void initState() {
    super.initState();
    _state = ReadAStoryScreenState();
    _controller = ReadAStoryScreenController(state: _state);
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.filter_list, size: 50.0,),
          onPressed: () => _controller.showCategoryFilter(context),
          color: AppColors.onTertiaryContainer,
        ),
        Expanded(
          child: CustomTextField(state: _controller.searchState),
        ),
        IconButton(
          icon: const Icon(Icons.search, size: 50.0,),
          onPressed: () => _controller.performSearch(_controller.searchState.controller.textController.text),
          color: AppColors.onTertiaryContainer,
        ),
      ],
    );
  }

  Widget _buildLastReadStory() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewStoryScreen()),
        );
      },
      child: Image.asset(
        'lib/assets/last_story.png',
        fit: BoxFit.contain,
        width: double.infinity,
      ),
    );
  }

  Widget _buildSuggestedStories() {
    return ListenableBuilder(
        listenable: _controller,
        builder: (context, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SUGGESTED STORIES',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onTertiaryContainer,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: ReadAStoryScreenState.carouselHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.getCategoriesToShow().length,
                  itemBuilder: (context, index) {
                    final category = _controller.getCategoriesToShow()[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewStoryScreen(),
                            ),
                          );
                        },
                        child: Image.asset(
                          _state.categoryImages[category]!,
                          width: ReadAStoryScreenState.carouselImageWidth,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
    );
  }

  Widget _buildNavigationBar() {
    final navigationItems = [
      NavigationItem(
        label: 'Home',
        icon: Icons.home_outlined,
        screen: const MainPageScreen(),
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

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.secondaryFixedDim,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navigationItems.map((item) => GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                    item.screen,
                    transitionsBuilder: (context, animation,
                        secondaryAnimation, child) {
                      return child;
                    },
                  ),
                );
              },
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

  @override
  Widget build(BuildContext context) {
    _controller.updateDimensions(context);

    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(ReadAStoryScreenState.basePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: ReadAStoryScreenState.baseSpacing),
                      SvgPicture.asset(
                        'lib/assets/readlight_book.svg',
                        height: ReadAStoryScreenState.baseLogoSize,
                        width: ReadAStoryScreenState.baseLogoSize,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: ReadAStoryScreenState.baseSpacing),
                      _buildSearchBar(),
                      const SizedBox(height: ReadAStoryScreenState.baseSpacing),
                      _buildLastReadStory(),
                      const SizedBox(height: ReadAStoryScreenState.baseSpacing),
                      _buildSuggestedStories(),
                    ],
                  ),
                ),
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