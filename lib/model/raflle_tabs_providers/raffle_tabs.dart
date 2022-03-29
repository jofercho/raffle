import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RaffleTabsNavigation extends ChangeNotifier {
  int _currentTab = 0;
  List<TabIcon> tabIcons = [
    TabIcon(),
    TabIcon(),
    TabIcon(),
    TabIcon()
  ];

  int get currentTab {
    return _currentTab;
  }

  set currentTab(int currentTab) {
    if(currentTab == _currentTab){
      return;
    }
    tabIcons[_currentTab].color = TabIcon.onNormalColor;
    _currentTab = currentTab;
    tabIcons[_currentTab].color = TabIcon.onPressedColor;
    notifyListeners();
  }

  Color get currentTabColor{
    return tabIcons[_currentTab].color;
  }

  Color getTabColor(int index){
    return tabIcons[index].color;
  }
}

class TabIcon extends ChangeNotifier {
  static const Color onNormalColor = Colors.black;
  static const Color onPressedColor = Colors.white;

  Color _currentColor = onNormalColor;

  Color get color {
    return _currentColor;
  }

  set color(Color color){
    _currentColor = color;
    // notifyListeners();
  }
}
