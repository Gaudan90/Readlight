import 'package:flutter/material.dart';
import 'package:readlight/screens/new_story_screen.dart';
import '../controllers/new_story_screen_controller.dart';

class NewStoryScreenState extends State<NewStoryScreen> {
  late final NewStoryScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NewStoryScreenController();
    _controller.initializeComments();
    _controller.addListener(_handleControllerUpdate);
  }

  void _handleControllerUpdate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return buildScreen(context, _controller);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerUpdate);
    _controller.dispose();
    super.dispose();
  }
}
