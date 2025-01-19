import 'package:flutter/material.dart';
import '../widgets/back_button.dart';
import '../widgets/survey_button.dart';
import '../widgets/like_button.dart';
import '../theme/app_colors.dart';
import '../controllers/new_story_screen_controller.dart';
import '../widgets/avatar_image.dart';
import '../states/new_story_screen_state.dart';

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

class NewStoryScreen extends StatefulWidget {
  const NewStoryScreen({super.key});

  @override
  State<NewStoryScreen> createState() => NewStoryScreenState();
}

class UserComment extends StatelessWidget {
  final String name;
  final String comment;
  final bool isEven;
  final bool isCurrentUser;

  const UserComment({
    required this.name,
    required this.comment,
    required this.isEven,
    required this.isCurrentUser,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle commentStyle = TextStyle(
      fontFamily: 'Formal',
      fontSize: 14,
      color: isEven ? AppColors.onSurfaceVariant : AppColors.lightYellow,
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isEven ? AppColors.lightYellow : AppColors.onSurfaceVariant,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          if (!isEven) ...[
            AvatarImage(
              username: name,
              isCurrentUser: isCurrentUser,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                comment,
                style: commentStyle,
              ),
            ),
          ] else ...[
            Expanded(
              child: Text(
                comment,
                style: commentStyle,
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(width: 10),
            AvatarImage(
              username: name,
              isCurrentUser: isCurrentUser,
            ),
          ],
        ],
      ),
    );
  }
}

Widget buildScreen(BuildContext context, NewStoryScreenController controller) {
  const TextStyle headerStyle = TextStyle(
    fontFamily: 'Formal',
    fontSize: 18,
    color: AppColors.lightYellow,
    fontWeight: FontWeight.bold,
  );

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
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const Row(
              children: [
                SizedBox(height: 25),
                BackButtonWidget(),
                SizedBox(width: 10),
                LikeButtonWidget(),
                SizedBox(width: 10),
                Expanded(
                  child: Center(
                    child: Text(
                      'Love and vote!',
                      style: headerStyle,
                    ),
                  ),
                ),
                SurveyButtonWidget(),
                SizedBox(width: 10),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStoryContainer(),
                    const SizedBox(height: 30),
                    _buildCommentsContainer(controller),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          CustomNavigationBar(items: navigationItems),
        ],
      ),
    ),
  );
}

Widget _buildStoryContainer() {
  const TextStyle formalStyle = TextStyle(
    fontFamily: 'Formal',
    fontSize: 16,
    color: Colors.black,
  );

  return Container(
    height: 300,
    decoration: BoxDecoration(
      color: AppColors.lightBeige,
      borderRadius: BorderRadius.circular(25),
    ),
    child: const SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "In the small village of Eldoria, nestled between ancient forests and rolling hills, lived a young girl named Elara. One day, while exploring the attic of her grandmother's house, she discovered an old, dusty compass. Unlike any compass she had before, its needle glowed faintly with a mysterious blue light.",
              style: formalStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Elara's grandmother, an old woman with a twinkle in her eye and a lifetime of stories...",
              style: formalStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildCommentsContainer(NewStoryScreenController controller) {
  return Container(
    height: 350,
    decoration: BoxDecoration(
      color: AppColors.lightBeige,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Stack(
      children: [
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ...List.generate(
                  controller.visibleComments.length,
                  (index) => UserComment(
                    name: controller.visibleComments[index].name,
                    comment: controller.visibleComments[index].comment,
                    isEven: index.isEven,
                    isCurrentUser: controller
                        .isCurrentUser(controller.visibleComments[index].name),
                  ),
                ),
                if (controller.visibleComments.length >= 3)
                  const SizedBox(height: 60),
              ],
            ),
          ),
        ),
        if (controller.visibleComments.length >= 3)
          _buildCommentInput(controller),
      ],
    ),
  );
}

Widget _buildCommentInput(NewStoryScreenController controller) {
  return Positioned(
    left: 0,
    right: 0,
    bottom: 0,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.lightBeige,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(23),
          bottomRight: Radius.circular(23),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.commentController,
              maxLength: 100,
              decoration: InputDecoration(
                hintText: 'Write your comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                counterText: '',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              controller.addNewComment(controller.commentController.text);
            },
          ),
        ],
      ),
    ),
  );
}
