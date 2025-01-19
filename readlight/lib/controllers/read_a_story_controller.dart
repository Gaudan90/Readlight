import 'package:flutter/material.dart';
import '../states/custom_text_field_state.dart';
import '../controllers/custom_text_field_controller.dart';
import '../states/read_a_story_state.dart';

class ReadAStoryScreenController extends ChangeNotifier {
  final ReadAStoryScreenState state;
  final CustomTextFieldState searchState;
  final CustomTextFieldController searchController;

  ReadAStoryScreenController({
    required this.state,
  }) : searchController = CustomTextFieldController(initiallyObscured: false),
        searchState = CustomTextFieldState(
          label: 'Search a story...',
          keyboardType: TextInputType.text,
          controller: CustomTextFieldController(initiallyObscured: false),
        );

  void updateDimensions(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    state.updateDimensions(
      width: mediaQuery.size.width,
      height: mediaQuery.size.height,
    );
  }

  void setSelectedCategory(String category) {
    state.selectedCategory = category;
    state.resetSearch();
    notifyListeners();
  }

  void performSearch(String query) {
    state.activateSearch();
    notifyListeners();
  }

  void showCategoryFilter(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Category'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: state.categories.map((category) {
                return ListTile(
                  title: Text(category.toUpperCase()),
                  onTap: () {
                    setSelectedCategory(category);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  List<String> getCategoriesToShow() {
    if (state.isSearchActive) {
      return state.filteredCategories;
    }
    return state.categories;
  }

  @override
  void dispose() {
    searchState.controller.dispose();
    super.dispose();
  }
}