// avatar_service.dart
class AvatarService {
  static final AvatarService _instance = AvatarService._internal();

  factory AvatarService() {
    return _instance;
  }

  AvatarService._internal();

  static const String baseAvatarUrl = 'https://avatar.iran.liara.run/public';
  static const int currentUserAvatarNumber = 42;
  static const int maxAvatarNumber = 100;

  String getCurrentUserAvatarUrl() {
    return '$baseAvatarUrl/$currentUserAvatarNumber';
  }

  String getAvatarUrl({
    required String username,
    bool isCurrentUser = false,
  }) {
    if (isCurrentUser) {
      return getCurrentUserAvatarUrl();
    }

    final int avatarNumber = _getAvatarNumber(
      username: username,
      isCurrentUser: isCurrentUser,
    );

    return '$baseAvatarUrl/$avatarNumber';
  }

  int _getAvatarNumber({
    required String username,
    required bool isCurrentUser,
  }) {
    if (isCurrentUser) {
      return currentUserAvatarNumber;
    }

    final int hash = username.hashCode.abs();
    return (hash % maxAvatarNumber) + 1;
  }

  String getAvatarUrlByNumber(int number) {
    assert(number > 0 && number <= maxAvatarNumber,
        'Avatar number must be between 1 and $maxAvatarNumber');
    return '$baseAvatarUrl/$number';
  }
}
