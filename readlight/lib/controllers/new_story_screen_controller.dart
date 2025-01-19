import 'package:flutter/material.dart';
import 'dart:async';

class NewStoryScreenController extends ChangeNotifier {
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
  Timer? _timer;
  int _lastGeneratedIndex = 3;

  void initializeComments() {
    visibleComments = allComments.take(3).toList();
    _lastGeneratedIndex = 2;
    startShowingComments();
  }

  void startShowingComments() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_lastGeneratedIndex < allComments.length - 1) {
        _lastGeneratedIndex++;
        visibleComments.add(allComments[_lastGeneratedIndex]);
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void addNewComment(String text) {
    if (text.isEmpty) return;

    final newUserComment = CommentData("you", text);

    if (_lastGeneratedIndex >= allComments.length - 1) {
      visibleComments.add(newUserComment);
    } else {
      final insertIndex = visibleComments.indexWhere(
              (comment) => comment == allComments[_lastGeneratedIndex]) +
          1;
      visibleComments.insert(insertIndex, newUserComment);
    }

    commentController.clear();
    notifyListeners();
  }

  bool isCurrentUser(String username) {
    return username == "you";
  }

  @override
  void dispose() {
    commentController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}

class CommentData {
  final String name;
  final String comment;

  CommentData(this.name, this.comment);
}
