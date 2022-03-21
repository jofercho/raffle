import 'package:flutter/material.dart';

class RaffleList extends StatelessWidget {
  // late List myList;
  const RaffleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    List myList = List.generate(
      20,
      (index) => "Item: ${index + 1}",
    );
    return PageView.builder(
      controller: controller,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Center(
          child: Text('child ${index + 1}'),
        );
      },
    );
  }
}
