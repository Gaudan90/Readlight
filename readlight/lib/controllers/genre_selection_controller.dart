import 'package:flutter/material.dart';
import 'package:readlight/screens/daily_quote_screen.dart';
import '../states/genre_selection_state.dart';
import '../utilities/navigation_helper.dart';

class GenreSelectionController extends ChangeNotifier {
  final GenreSelectionState state;
  final VoidCallback onStateChanged;

  GenreSelectionController({
    required this.state,
    required this.onStateChanged,
  });

  void toggleGenreSelection(int index) {
    state.toggleGenre(index);
    onStateChanged();
  }

  void onContinuePressed(BuildContext context) {
    final selectedGenres = state.getSelectedGenres();
    if (selectedGenres.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one genre'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    NavigationHelper.turnPageNavigate(
      context: context,
      page: const DailyQuoteScreen(),
    );
  }
}