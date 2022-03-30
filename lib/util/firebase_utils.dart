import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io' show Platform;

class FirebaseUtils {
  static final FirebaseUtils _singleton = FirebaseUtils._internal();

  factory FirebaseUtils() {
    return _singleton;
  }

  FirebaseUtils._internal();

  initialize() async {
    await Firebase.initializeApp();
    if (const bool.fromEnvironment("USE_FIREBASE_EMULATORS")) {
      await _configureFirebaseAuth();
      _configureFireStore();
    }
  }

  _configureFirebaseAuth() async {
    String host = "localhost";
    int port = 9099;
    await FirebaseAuth.instance.useAuthEmulator(host, port);
  }

  _configureFireStore() {
    String host = Platform.isAndroid? '10.0.2.2' : 'localhost';
    int port = 8080;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.settings = Settings(
        persistenceEnabled: false, host: '$host:$port', sslEnabled: false);
  }
}
