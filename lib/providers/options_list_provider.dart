import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomViewListProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  // Init a page controller
  PageController pageController = PageController();

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);

    notifyListeners();
  }

  void updateIndex(int intex){
    pageController.animateToPage(intex,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
        
    _selectedIndex = intex;
    notifyListeners();
  }
}