import 'package:flutter/material.dart';
import 'package:readlight/data/avatar_api.dart';
import '../data/avatar_api.dart';

class AvatarImage extends StatelessWidget {
  final String username;
  final bool isCurrentUser;
  final double size;
  final AvatarService _avatarService = AvatarService();

  AvatarImage({
    required this.username,
    required this.isCurrentUser,
    this.size = 40,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: Colors.transparent,
      backgroundImage: NetworkImage(
        _avatarService.getAvatarUrl(
          username: username,
          isCurrentUser: isCurrentUser,
        ),
      ),
    );
  }
}
