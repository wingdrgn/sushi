import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void toggleLanguage() {
    if (_locale != const Locale('en')) {
      _locale = const Locale('en');
    } else {
      _locale = const Locale('zh');
    }
    notifyListeners();
  }
}
