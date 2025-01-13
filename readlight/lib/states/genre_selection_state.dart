class Genre {
  final String name;
  final String imagePath;

  const Genre({
    required this.name,
    required this.imagePath,
  });
}

class GenreSelectionState {
  final String userRole;
  final List<Genre> genres;
  final Set<int> selectedGenres;

  GenreSelectionState({
    required this.userRole,
  }) : genres = const [
    Genre(name: 'Fantasy', imagePath: 'lib/assets/fantasy.png'),
    Genre(name: 'Horror', imagePath: 'lib/assets/horror.png'),
    Genre(name: 'Mystery', imagePath: 'lib/assets/mystery.png'),
    Genre(name: 'Narrative', imagePath: 'lib/assets/narrative.png'),
    Genre(name: 'Romantic', imagePath: 'lib/assets/romantic.png'),
    Genre(name: 'Other', imagePath: 'lib/assets/other.png'),
  ],
        selectedGenres = {};

  bool isGenreSelected(int index) => selectedGenres.contains(index);

  void toggleGenre(int index) {
    if (isGenreSelected(index)) {
      selectedGenres.remove(index);
    } else {
      selectedGenres.add(index);
    }
  }

  List<Genre> getSelectedGenres() {
    return selectedGenres.map((index) => genres[index]).toList();
  }
}