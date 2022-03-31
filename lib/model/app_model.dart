import 'package:flutter/widgets.dart';

class AppModel extends ChangeNotifier
{
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set setLoading(bool isLoading){
    _isLoading = isLoading;
    notifyListeners();
  }
}