import 'dart:io';
import 'dart:typed_data';

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
      int tickets, DateTime date) async {
    print(
        'creating in firestore $title, $description, $picture, $price, $tickets, $date');
    String uid = FirebaseAuth.instance.currentUser!.uid;

    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpg');
    File file = File(picture);
    storage
        .ref('raffles')
        .child(picture.split('/').last)
        .putFile(file, metadata)
        .then((snapshot) async {
      if (snapshot.state == TaskState.success) {
        RaffleModel raffleModel = RaffleModel(
          organizerUid: uid,
          title: title,
          description: description,
          picture: await snapshot.ref.getDownloadURL(),
          price: price,
          tickets: tickets,
          dateTime: date,
          winnersUids: List.empty(),
          participantsUids: List.empty()
        );
        raffleModel.raffleRef.add(raffleModel);
      }
    });
  }

  getRaffles() {}

  Future<String?> getRaffleImage(String picture) async {
    Reference pictureRef =
        storage.ref('raffles').child(picture.split('/').last);
    try {
      return await pictureRef.getDownloadURL();
    } on FirebaseException catch (exception) {
      print('Exception when downloading image to memory $exception');
      return null;
    }
  }

  buyTicket(String id) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference documentReference = firestore.collection('raffles').doc(id);
    return firestore
        .runTransaction((transaction) async {
          
          DocumentSnapshot snapshot = await transaction.get(documentReference);
          if (!snapshot.exists) {
            throw Exception('Document does not exists');
          }
          return transaction.update(documentReference, {'participantsUids': FieldValue.arrayUnion([uid])});
        })
        .then((value) => print('tickets updated'))
        .catchError((error) => print("Failed to update tickets: $error"));
  }
}
