import 'package:flutter/material.dart';

class RaffleCard extends StatelessWidget {
  const RaffleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          child: Center(child: Text('aca va la imagen')),
        ),
        Row(
          children: [
            Column(
              children: [
                Text('Numeros comprados'),
                Text('2/3'),
              ],
            ),
            Column(
              children: [
                Text('Valor del nro'),
                Text('S/. 2'),
              ],
            ),
          ],
        ),
        
      ]),
    );
  }
}
