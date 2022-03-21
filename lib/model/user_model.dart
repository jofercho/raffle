import 'package:raffle/model/contact_model.dart';

class UserModel extends ContactModel{
  late String userId;
  bool _isAuthenticated = true;

  UserModel.empty(){
    userId = '';
  }

  UserModel({required this.userId});

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticaded(bool isAuthenticated){
    _isAuthenticated = isAuthenticated;
    notifyListeners();
  }
}
