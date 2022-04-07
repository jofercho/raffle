import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:raffle/model/raffle_model.dart';

class RaffleService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  static final RaffleService _raffleService = RaffleService._internal();
  factory RaffleService() {
    return _raffleService;
  }

  RaffleService._internal();

  createRaffle(String title, String description, String picture, double price,
      int tickets, DateTime date) {
    print(
        'creating in firestore $title, $description, $picture, $price, $tickets, $date');
    String uid = FirebaseAuth.instance.currentUser!.uid;

    RaffleModel raffleModel = RaffleModel(
      organizerUid: uid,
      title: title,
      description: description,
      picture: picture,
      price: price,
      tickets: tickets,
      dateTime: date,
    );
    raffleModel.raffleRef.add(raffleModel);
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpg');
    File file = File(picture);
    storage
        .ref('raffles')
        .child(picture.split('/').last)
        .putFile(file, metadata);
  }
}
