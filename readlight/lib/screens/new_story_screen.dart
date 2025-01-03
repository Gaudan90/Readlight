import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/back_button.dart';
import '../widgets/survey_button.dart';
import '../widgets/like_button.dart';

class NewStoryScreen extends StatelessWidget {
  const NewStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE5AB),
      body: Stack(
        children: [
          const Positioned(
            top: 20,
            left: 20,
            child: BackButtonWidget(),
          ),
          const Positioned(
            top: 20,
            left: 70,
            child: LikeButtonWidget(),
          ),
          Positioned(
            top: 20,
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: const Text(
              'Love and vote!',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFEAE5AB),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 20,
            right: 20,
            child: SurveyButtonWidget(),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            name: "persona1",
                            comment:
                                "I think their teamwork was the key to solve it.",
                          ),
                          UserComment(
                            name: "persona2",
                            comment:
                                "I wonder what will happen in the next chapter, if there will be one.",
                          ),
                          UserComment(
                            name: "persona3",
                            comment:
                                "It would be great if there was not a sequel, but a prequel.",
                          ),
                        ],
                      ),
                    ),
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

  const UserComment({required this.name, required this.comment, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(name[0]),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              comment,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
