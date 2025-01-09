import 'package:flutter/material.dart';
import '../widgets/back_button.dart';
import '../widgets/survey_button.dart';
import '../widgets/like_button.dart';
import '../theme/app_colors.dart';

class NewStoryScreen extends StatelessWidget {
  const NewStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: const Row(
              children: [
                BackButtonWidget(),
                SizedBox(width: 10),
                LikeButtonWidget(),
                Expanded(
                  child: Center(
                    child: Text(
                      'Love and vote!',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.lightYellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SurveyButtonWidget(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "In the small village of Eldoria, nestled between ancient forests and rolling hills, lived a young girl named Elara. One day, while exploring the attic of her grandmother's house, she discovered an old, dusty compass. Unlike any compass she had before, its needle glowed faintly with a mysterious blue light.",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Elara's grandmother, an old woman with a twinkle in her eye and a lifetime of stories...",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        children: [
                          UserComment(
                            name: "p1",
                            comment:
                                "I think their teamwork was the key to solve it.",
                            isEven: false,
                          ),
                          UserComment(
                            name: "p2",
                            comment:
                                "I wonder what will happen in the next chapter, if there will be one.",
                            isEven: true,
                          ),
                          UserComment(
                            name: "p3",
                            comment:
                                "It would be great if there was not a sequel, but a prequel.",
                            isEven: false,
                          ),
                          UserComment(
                            name: "p4",
                            comment:
                                "The magical compass reminded me of my childhood adventures.",
                            isEven: true,
                          ),
                          UserComment(
                            name: "p5",
                            comment:
                                "The description of Eldoria was so vivid, I felt like I was there.",
                            isEven: false,
                          ),
                          UserComment(
                            name: "p6",
                            comment:
                                "The grandmother's character seems very interesting.",
                            isEven: true,
                          ),
                          UserComment(
                            name: "p7",
                            comment:
                                "I love how the story combines mystery with family bonds.",
                            isEven: false,
                          ),
                          UserComment(
                            name: "p8",
                            comment:
                                "Can't wait to discover what the blue light means!",
                            isEven: true,
                          ),
                          UserComment(
                            name: "p9",
                            comment:
                                "The attic scene set up the perfect atmosphere.",
                            isEven: false,
                          ),
                          UserComment(
                            name: "p10",
                            comment:
                                "This story has great potential for a series.",
                            isEven: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserComment extends StatelessWidget {
  final String name;
  final String comment;
  final bool isEven;

  const UserComment({
    required this.name,
    required this.comment,
    required this.isEven,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          if (!isEven) ...[
            CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(name[0].toUpperCase()),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                comment,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ] else ...[
            Expanded(
              child: Text(
                comment,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(name[0].toUpperCase()),
            ),
          ],
        ],
      ),
    );
  }
}
