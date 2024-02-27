import 'package:flutter/material.dart';

class PageDataProvider extends ChangeNotifier {
  int _pageNumber = 0;

  int get pageNumber => _pageNumber;

  set pageNumber(int value) {
    _pageNumber = value;
    notifyListeners();
  }
}
