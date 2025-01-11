class RoleSelectionState {
  static const double baseWidth = 196.0;
  static const double baseHeight = 397.0;
  static const double baseAspectRatio = baseHeight / baseWidth;

  double _screenWidth = 0;
  double _screenHeight = 0;
  double _horizontalPadding = 0;
  double _spacingUnit = 0;
  double _logoSize = 0;
  double _roleImageSize = 0;
  double _buttonWidth = 0;
  double _titleSize = 0;
  bool _isLandscape = false;

  double get screenWidth => _screenWidth;

  double get screenHeight => _screenHeight;

  double get horizontalPadding => _horizontalPadding;

  double get spacingUnit => _spacingUnit;

  double get logoSize => _logoSize;

  double get roleImageSize => _roleImageSize;

  double get buttonWidth => _buttonWidth;

  double get titleSize => _titleSize;

  bool get isLandscape => _isLandscape;

  void updateDimensions({
    required double width,
    required double height,
    required bool isLandscape,
  }) {
    _screenWidth = width;
    _screenHeight = height;
    _isLandscape = isLandscape;

    _adjustDimensions();
  }

  void _adjustDimensions() {
    if (_screenWidth >= 1024) {
      _screenWidth = baseWidth;
      _screenHeight = baseHeight;
    } else if (_screenWidth >= 768) {
      _screenWidth *= 0.4;
      _screenHeight = _screenWidth * baseAspectRatio;
    } else {
      _screenWidth *= 0.85;
      _screenHeight = _screenWidth * baseAspectRatio;
    }

    if (_isLandscape) {
      _horizontalPadding =
          _screenWidth * 0.03;
      _spacingUnit = _screenHeight * 0.0;
      _logoSize = _screenHeight * 0.15;
      _roleImageSize =
          _screenHeight * 0.30;
      _buttonWidth = _screenWidth * 0.5;
      _titleSize = _screenHeight * 0.06;
    } else {

      _horizontalPadding = _screenWidth * 0.05;
      _spacingUnit = _screenHeight * 0.015;
      _logoSize = _screenWidth * 0.35;
      _roleImageSize = _screenWidth * 0.7;
      _buttonWidth = _screenWidth * 0.5;
      _titleSize = _screenWidth * 0.1;
    }
  }
}