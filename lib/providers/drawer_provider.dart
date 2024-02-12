import 'package:flutter/widgets.dart';

class DrawerProvider extends ChangeNotifier {
  int selectedMenuIndex = 0;

  setSelectedMenuIndex(int index) {
    selectedMenuIndex = index;
    notifyListeners();
  }

  isMenuActive(int activeIndex) {
    return (selectedMenuIndex == activeIndex);
  }
}
