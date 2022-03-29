import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:raffle/model/user_model.dart';

class AuthService {
  static final AuthService _authService = AuthService._internal();
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  factory AuthService() {
    return _authService;
  }

  AuthService._internal();

  signIn(String email, String password) async {
    UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  signUp(String email, String password) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // UserModel//create a user a FireStore q tenga el mismo uid
      var userModel = UserModel(email: email, name: 'test', uid: value.user!.uid);
      userModel.userRef.add(userModel);
    });
  }

  test() async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: 'ssoj.josss@gmail.com', password: 'joSS42597698');
  }
}
