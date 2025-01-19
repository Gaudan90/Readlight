class ReadAStoryScreenState {
  final List<String> categories = [
    'horror',
    'fantasy',
    'romantic',
    'mystery',
    'narrative',
    'other'
  ];

  final Map<String, String> categoryImages = {
    'horror': 'lib/assets/echoes.png',
    'fantasy': 'lib/assets/flame.png',
    'romantic': 'lib/assets/keys.png',
    'mystery': 'lib/assets/legacy.png',
    'narrative': 'lib/assets/moonlight.png',
    'other': 'lib/assets/tide.png'
  };

  String selectedCategory = '';

  List<String> _filteredCategories = [];
  List<String> get filteredCategories => _filteredCategories;

  bool _isSearchActive = false;
  bool get isSearchActive => _isSearchActive;

  static const double baseLogoSize = 80.0;
  static const double basePadding = 16.0;
  static const double baseSpacing = 24.0;
  static const double carouselImageWidth = 150.0;
  static const double carouselHeight = 300.0;

  double _screenWidth = 0;
  double _screenHeight = 0;

  double get screenWidth => _screenWidth;
  double get screenHeight => _screenHeight;

  void updateDimensions({
    required double width,
    required double height,
  }) {
    _screenWidth = width;
    _screenHeight = height;
    _adjustDimensions();
  }

  void _adjustDimensions() {
    //TODO: Add logic for adaptable dimensions and responsiveness
  }

  void resetSearch() {
    _filteredCategories = [];
    _isSearchActive = false;
  }

  void activateSearch() {
    if (selectedCategory.isNotEmpty) {
      _filteredCategories = [selectedCategory];
      _isSearchActive = true;
    }
  }
}