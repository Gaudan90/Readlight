import 'package:flutter/material.dart';
import 'dart:async';

class NewStoryScreenController {
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
  final TextEditingController commentController = TextEditingController();
  int currentIndex = 3;
  Timer? _timer;

  void initializeComments() {
    visibleComments = allComments.take(3).toList();
    startShowingComments();
  }

  void startShowingComments() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentIndex < allComments.length) {
        visibleComments.add(allComments[currentIndex]);
        currentIndex++;
      } else {
        timer.cancel();
      }
    });
  }

  void addNewComment(String text) {
    if (text.isNotEmpty) {
      int insertIndex = currentIndex - 1;

      if (currentIndex >= allComments.length) {
        insertIndex = visibleComments.length;
      }

      visibleComments.insert(insertIndex, CommentData("you", text));
      commentController.clear();
    }
  }

  void dispose() {
    commentController.dispose();
    _timer?.cancel();
  }
}

class CommentData {
  final String name;
  final String comment;

  CommentData(this.name, this.comment);
}
