import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../screens/homepage_screen.dart';
import '../states/genre_selection_state.dart';
import '../theme/app_colors.dart';

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

    Navigator.of(context).push(
      TurnPageRoute(
        overleafColor: AppColors.secondaryFixedDim,
        animationTransitionPoint: 0.5,
        transitionDuration: const Duration(milliseconds: 800),
        builder: (context) => const HomePageScreen(),
      ),
    );
  }
}