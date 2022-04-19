import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class RaffleModel extends ChangeNotifier {
  late String id;
  final String title;
  final String description;
  final String picture;
  final double price;
  final int tickets; //this could be an object with user info
  final DateTime dateTime;
  final String organizerUid;
  final List<String> winnersUids;
  final List<String> participantsUids;

  RaffleModel(
      {
      required this.title,
      required this.description,
      required this.picture,
      required this.price,
      required this.tickets,
      required this.dateTime,
      required this.organizerUid,
      required this.winnersUids,
      required this.participantsUids});

  RaffleModel.fromJson(Map<String, Object?> json)
      : this(
          title: json['title']! as String,
          description: json['description']! as String,
          picture: json['picture']! as String,
          price: json['price']! as double,
          tickets: json['tickets']! as int,
          dateTime: (json['dateTime']! as Timestamp).toDate(),
          organizerUid: json['organizerUid']! as String,
          winnersUids: json['winnersUids']  == null ? List.empty() : json['winnersUids'] as List<String>,
          participantsUids: json['participantsUids'] == null ? List.empty() : List.from(['participantsUids'])
        );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'description': description,
      'picture': picture,
      'price': price,
      'tickets': tickets,
      'dateTime': dateTime,
      'organizerUid': organizerUid,
      'winnersUids': winnersUids,
      'participantsUids': participantsUids
    };
  }

  final CollectionReference<RaffleModel> raffleRef = FirebaseFirestore.instance
      .collection('raffles')
      .withConverter(
          fromFirestore: (snapshot, _) =>
              RaffleModel.fromJson(snapshot.data()!),
          toFirestore: (raffle, _) => raffle.toJson());
}
