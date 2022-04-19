import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raffle/model/raffle_model.dart';
import 'package:raffle/views/raffle_list/raffle_card.dart';

class RaffleList extends StatelessWidget {
  // late List myList;
  const RaffleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('raffles').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading');
            default:
              return PageView(
                controller: controller,
                scrollDirection: Axis.vertical,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  RaffleModel raffle = RaffleModel.fromJson(
                      document.data() as Map<String, Object?>);
                  raffle.id = document.id;
                  return RaffleCard(raffle: raffle);
                }).toList(),
              );
          }
        });
  }
}
