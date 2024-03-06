import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool _isTheme = true;
  get isTheme => _isTheme;

  void changeTheme() {
    _isTheme = !_isTheme;
    notifyListeners();
  }
}
