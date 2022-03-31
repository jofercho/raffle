import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:raffle/model/admin_model.dart';
import 'package:raffle/model/user_model.dart';

class UserService extends ChangeNotifier{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  createUser(String uid, String name, String email) async{
    UserModel user = UserModel(uid: "", name: "", email: "");
    await user.userRef.add(user).then((value) => print(value)).catchError((error) => print(error));
  }
}