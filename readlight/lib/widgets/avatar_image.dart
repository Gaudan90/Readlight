// widgets/avatar_image.dart
import 'package:flutter/material.dart';
import '../data/avatar_api.dart';

// widgets/avatar_image.dart
class AvatarImage extends StatelessWidget {
  final String username;
  final double size;
  final bool isCurrentUser;

  const AvatarImage({
    required this.username,
    this.size = 40,
    this.isCurrentUser = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.shade100,
      ),
      child: ClipOval(
        child: Image.network(
          AvatarService().getAvatarUrl(
            username: username,
            isCurrentUser: isCurrentUser,
          ),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(
                username[0].toUpperCase(),
                style: const TextStyle(fontFamily: 'Formal'),
              ),
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
