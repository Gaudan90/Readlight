import 'package:flutter/material.dart';
import 'package:readlight/screens/main_page_screen.dart';
import 'package:readlight/screens/read_a_story_screen.dart';
import '../states/main_page_state.dart';
import '../utilities/navigation_helper.dart';

class MainPageController {
  final MainPageState state;
  final BuildContext context;

  MainPageController(this.state, this.context);

  void onWriteStoryTapped() {
    NavigationHelper.turnPageNavigate(
      context: context,
      page: const MainPageScreen(),
    );
  }

  void onReadStoryTapped() {
    NavigationHelper.turnPageNavigate(
      context: context,
      page: const ReadAStoryScreen(),
    );
  }

  void onCommunityTapped() {
    NavigationHelper.turnPageNavigate(
      context: context,
      page: const MainPageScreen(),
    );
  }
}