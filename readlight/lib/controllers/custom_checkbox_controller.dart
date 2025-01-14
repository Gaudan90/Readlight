import 'package:flutter/material.dart';

class CustomCheckboxController extends ChangeNotifier {
  bool _isChecked;
  final Function(bool)? onChanged;

  CustomCheckboxController({
    bool initialValue = false,
    this.onChanged,
  }) : _isChecked = initialValue;

  bool get isChecked => _isChecked;

  void toggleCheckbox() {
    _isChecked = !_isChecked;
    onChanged?.call(_isChecked);
    notifyListeners();
  }
}