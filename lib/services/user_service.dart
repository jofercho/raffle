import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raffle/model/admin_model.dart';

class UserService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<AdminModel> createUser() async{
    CollectionReference<Map<String, dynamic>> usersCollection = firestore.collection('users');
    return usersCollection.add({
      'name':'test',
      'age':32
    }).then((value) {
      print('create user model');
      return AdminModel();
    }).catchError((error){
      print('error: '+error);
    });
  }
}