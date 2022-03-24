import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtils{
  static final FirebaseUtils _singleton = FirebaseUtils._internal();

  factory FirebaseUtils(){
    return _singleton;
  }

  FirebaseUtils._internal();

  initialize() async{
    await Firebase.initializeApp();
    if(const bool.fromEnvironment("USE_FIREBASE_EMULATORS")){
      await _configureFirebaseAuth();
    }
  }

  _configureFirebaseAuth() async{
    String host = "localhost";
    int port = 9099;
    await FirebaseAuth.instance.useAuthEmulator(host, port);
  }
  
}