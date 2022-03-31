import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class RaffleModel extends ChangeNotifier {
  final String title;
  final String description;
  // final picture TODO: get picture from firebase storage
  final double price;
  final int tickets; //this could be an object with user info
  final DateTime dateTime;
  final String organizerUid;
  List<String> winnersUids = List.empty();
  List<String> participantsUids = List.empty();

  RaffleModel(
      {required this.title,
      required this.description,
      required this.price,
      required this.tickets,
      required this.dateTime,
      required this.organizerUid});

  RaffleModel.fromJson(Map<String, Object?> json)
      : this(
          title: json['title']! as String,
          description: json['description']! as String,
          price: json['price']! as double,
          tickets: json['tickets']! as int,
          dateTime: json['dateTime']! as DateTime,
          organizerUid: json['organizerUid']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'tickets': tickets,
      'dateTime': dateTime,
      'organizerUid': organizerUid,
    };
  }

  final CollectionReference<RaffleModel> raffleRef = FirebaseFirestore.instance.collection('raffles').withConverter(
    fromFirestore: (snapshot, _)=>RaffleModel.fromJson(snapshot.data()!), 
    toFirestore: (raffle, _)=> raffle.toJson());
}
