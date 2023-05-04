import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int currentPage = 0;

  void setCurrentPage({required int page}) {
    currentPage = page;
    notifyListeners();
  }
}
