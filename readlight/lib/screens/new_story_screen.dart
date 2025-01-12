import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/back_button.dart';
import '../widgets/survey_button.dart';
import '../widgets/like_button.dart';
import '../theme/app_colors.dart';

class NewStoryScreen extends StatefulWidget {
  const NewStoryScreen({super.key});

  @override
  State<NewStoryScreen> createState() => _NewStoryScreenState();
}

class _NewStoryScreenState extends State<NewStoryScreen> {
  final List<CommentData> allComments = [
    CommentData("p1", "I think their teamwork was the key to solve it."),
    CommentData("p2",
        "I wonder what will happen in the next chapter, if there will be one."),
    CommentData(
        "p3", "It would be great if there was not a sequel, but a prequel."),
    CommentData(
        "p4", "The magical compass reminded me of my childhood adventures."),
    CommentData("p5",
        "The description of Eldoria was so vivid, I felt like I was there."),
    CommentData("p6", "The grandmother's character seems very interesting."),
    CommentData(
        "p7", "I love how the story combines mystery with family bonds."),
    CommentData("p8", "Can't wait to discover what the blue light means!"),
    CommentData("p9", "The attic scene set up the perfect atmosphere."),
    CommentData("p10", "This story has great potential for a series."),
  ];

  List<CommentData> visibleComments = [];
  final TextEditingController _commentController = TextEditingController();
  int currentIndex = 3;

  @override
  void initState() {
    super.initState();
    visibleComments = allComments.take(3).toList();
    _startShowingComments();
  }

  void _startShowingComments() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentIndex < allComments.length) {
        setState(() {
          visibleComments.add(allComments[currentIndex]);
          currentIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _addNewComment(String text) {
    if (text.isNotEmpty) {
      setState(() {
        visibleComments[2] = CommentData("you", text);
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle formalStyle = TextStyle(
      fontFamily: 'Formal',
      fontSize: 16,
      color: Colors.black,
    );

    const TextStyle headerStyle = TextStyle(
      fontFamily: 'Formal',
      fontSize: 18,
      color: AppColors.lightYellow,
      fontWeight: FontWeight.bold,
    );

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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 240,
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
                    ),
                    const SizedBox(height: 30),
                    Container(
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
                                  ...visibleComments
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    final index = entry.key;
                                    final comment = entry.value;
                                    return UserComment(
                                      name: comment.name,
                                      comment: comment.comment,
                                      isEven: index.isEven,
                                    );
                                  }),
                                  if (visibleComments.length >= 3)
                                    const SizedBox(height: 60),
                                ],
                              ),
                            ),
                          ),
                          if (visibleComments.length >= 3)
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.lightBeige,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(23),
                                    bottomRight: Radius.circular(23),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _commentController,
                                        maxLength: 100,
                                        decoration: InputDecoration(
                                          hintText: 'Write your comment...',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          counterText: '',
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.send),
                                      onPressed: () => _addNewComment(
                                          _commentController.text),
                                    ),
                                  ],
                                ),
                              ),
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

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}

class CommentData {
  final String name;
  final String comment;

  CommentData(this.name, this.comment);
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
            CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(
                name[0].toUpperCase(),
                style: const TextStyle(fontFamily: 'Formal'),
              ),
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
            CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(
                name[0].toUpperCase(),
                style: const TextStyle(fontFamily: 'Formal'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
