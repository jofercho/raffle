import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io' show Platform;

import 'package:firebase_storage/firebase_storage.dart';

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
      _configureStorage();
    }
  }

  _configureFirebaseAuth() async {
    String host = "localhost";
    int port = 9099;
    await FirebaseAuth.instance.useAuthEmulator(host, port);
  }

  _configureFireStore() {
    String host = Platform.isAndroid? '10.0.2.2' : 'localhost';
    int port = 8081;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // firestore.useFirestoreEmulator(host, port);
    firestore.settings = Settings(
        persistenceEnabled: false, host: '$host:$port', sslEnabled: false);
  }

  _configureStorage(){
    String host = Platform.isAndroid? '10.0.2.2' : 'localhost';
    int port = 9199;
    FirebaseStorage.instance.useStorageEmulator(host, port);
  }
}
