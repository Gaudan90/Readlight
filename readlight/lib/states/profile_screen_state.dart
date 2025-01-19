import 'package:flutter/material.dart';

class ProfileState {
  static const String defaultAliasName = "ALIAS NAME";
  static const String defaultQuote = "YOUR FAVORITE QUOTE IS HERE";
  static const String defaultDescription = """
WELCOME TO MY PROFILE! HERE YOU CAN ADD A VARIETY OF ELEMENTS TO GIVE A COMPREHENSIVE OVERVIEW OF YOUR PROFESSIONAL BACKGROUND AND PERSONAL
""";

  bool isMusicOn;
  String aliasName;
  String quote;
  String description;
  final TextEditingController descriptionController;

  ProfileState({
    this.isMusicOn = true,
    this.aliasName = defaultAliasName,
    this.quote = defaultQuote,
    this.description = defaultDescription,
  }) : descriptionController = TextEditingController(text: defaultDescription);

  void dispose() {
    descriptionController.dispose();
  }
}
