import 'package:flutter/material.dart';

class ProfileHoverController extends ChangeNotifier {
  int hoveringIndex = 0;

  void updateHoverungIndex(int index) {
    hoveringIndex = index;
    notifyListeners();
  }
}
