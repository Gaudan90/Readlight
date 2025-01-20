import 'package:flutter/material.dart';

import '../states/settings_screen_state.dart';

class SettingsScreenController extends ChangeNotifier {
  final SettingsScreenState state;

  SettingsScreenController({required this.state});

  void handleUnblockerPress() {
    // TODO: Implement unblocker logic!
  }

  void handleFontSizeChange(double newSize) {
    state.currentFontSize = newSize;
    notifyListeners();
  }

  void handleThemeChange() {
    // TODO: Implement theme change logic!
    notifyListeners();
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}