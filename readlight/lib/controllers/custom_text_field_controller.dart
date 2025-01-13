import 'package:flutter/material.dart';

class CustomTextFieldController extends ChangeNotifier {
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final bool initiallyObscured;
  String? _errorText;
  bool _isObscured;

  CustomTextFieldController({
    TextEditingController? controller,
    this.validator,
    required this.initiallyObscured,
  }) : textController = controller ?? TextEditingController(),
        _isObscured = initiallyObscured;

  bool get isObscured => _isObscured;
  bool get shouldShowIcon => initiallyObscured;
  String? get errorText => _errorText;
  String get text => textController.text;

  set text(String value) {
    textController.text = value;
    validate();
    notifyListeners();
  }

  void toggleObscured() {
    _isObscured = !_isObscured;
    notifyListeners();
  }

  void setText(String value) {
    text = value;
  }

  bool validate() {
    if (validator != null) {
      _errorText = validator!(textController.text);
      notifyListeners();
      return _errorText == null;
    }
    return true;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}