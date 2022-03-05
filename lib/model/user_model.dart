import 'package:chat_provider/model/contact_model.dart';

class UserModel extends ContactModel{
  late String userId;
  bool _isAuthenticated = false;

  UserModel.empty(){
    userId = '';
  }

  UserModel({required this.userId});

  bool get isAuthenticated => _isAuthenticated;

  set setAuthenticaded(bool isAuthenticated){
    _isAuthenticated = isAuthenticated;
    notifyListeners();
  }
}
