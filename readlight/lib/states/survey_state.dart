class SurveyScreenState {
  int? selectedOption;
  final Map<int, String> _percentages = {
    1: '20%',
    2: '45%',
    3: '35%',
  };
  Map<int, String> get percentages => _percentages;

  String getOptionText(int option) {
    switch (option) {
      case 1:
        return 'Kindly proceed with an entirely new narrative${selectedOption == 1 ? ' (${_percentages[1]})' : ''}';
      case 2:
        return 'I would be grateful to experience the preceding narrative${selectedOption == 2 ? ' (${_percentages[2]})' : ''}';
      case 3:
        return 'I would appreciate reading the subsequent narrative${selectedOption == 3 ? ' (${_percentages[3]})' : ''}';
      default:
        return '';
    }
  }
}
