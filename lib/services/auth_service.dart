import 'package:firebase_auth/firebase_auth.dart';
import 'package:raffle/model/user_model.dart';

class AuthService {
  static final AuthService _authService = AuthService._internal();
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  factory AuthService() {
    return _authService;
  }

  AuthService._internal();

  signIn(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  signUp(String email, String password) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // UserModel//create a user a FireStore q tenga el mismo uid
      var userModel = UserModel(email: email, name: 'test', uid: value.user!.uid);

      return userModel.userRef.add(userModel);
    });
  }

  test() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: 'ssoj@mail.com', password: 'ssOJ1234');
  }
}
