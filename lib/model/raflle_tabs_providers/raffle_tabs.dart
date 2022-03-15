import 'package:flutter/cupertino.dart';

class RaffleTabsNavigation extends ChangeNotifier{
  double _currentTab = 0.0;

  double get currentTab{return _currentTab;}

  set currentTab(double currentTab){
    _currentTab = currentTab;
    notifyListeners();
  }
}