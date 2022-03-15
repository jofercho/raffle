import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return Stack(children: [
      PageView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Center(
            child: Text('child ${index + 1}'),
          );
        },
      ),
      
      Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Text('2', style: TextStyle(color: Colors.black)),
            Text('3', style: TextStyle(color: Colors.black)),
            Text('1', style: TextStyle(color: Colors.black)),
            
          ],
        ),
      )
    ]
    );
  }
}
