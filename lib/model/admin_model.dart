import 'package:raffle/model/user_model.dart';

class AdminModel extends UserModel {
  bool _isAuthenticated = false;

  AdminModel():super(email: "",name: "",uid:"" );

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticaded(bool isAuthenticated) {
    _isAuthenticated = isAuthenticated;
    notifyListeners();
  }
}

class Test{
  String test = '';
  Test(){
    test='esto es un test';
  }
}