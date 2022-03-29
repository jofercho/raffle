import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  final String uid;
  final String name;
  final String email;

  UserModel({required this.uid, required this.name, required this.email});

  UserModel.fromJson(Map<String, Object?> json)
      : this(
            email: json['email']! as String,
            name: json['name']! as String,
            uid: json['uid'] as String);

  Map<String, Object?> toJson() {
    return {'uid': uid, 'email': email, 'name': name};
  }

  final userRef = FirebaseFirestore.instance.collection('users').withConverter(
      fromFirestore: ((snapshot, _) => UserModel.fromJson(snapshot.data()!)),
      toFirestore: (user, _) => user.toJson());
}
