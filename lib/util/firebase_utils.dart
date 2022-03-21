import 'package:firebase_core/firebase_core.dart';
class FirebaseUtils{
  static final FirebaseUtils _singleton = FirebaseUtils._internal();

  factory FirebaseUtils(){
    return _singleton;
  }

  FirebaseUtils._internal();

  Future connectToFirebaseEmulators() async{
    final String URL = '192.168.1.13';
    // Firebase 
  }
}