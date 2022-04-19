import 'package:flutter/material.dart';
import 'package:raffle/model/raffle_model.dart';
import 'package:raffle/services/raffle_service.dart';

class RaffleCard extends StatelessWidget {
  final RaffleModel raffle;
  const RaffleCard({Key? key, required this.raffle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.network(
        raffle.picture,
        fit: BoxFit.fitHeight,
        height: double.infinity,
      ),
      Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleBG(
              myWidget: Title(raffle: raffle),
            ),
            const SizedBox(
              height: 300,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleBG(
                    myWidget: Tickets(raffle: raffle),
                  ),
                  CircleBG(myWidget: RafflePrice(raffle: raffle)),
                ],
              ),
            ),
            BuyButton(raffleModel: raffle,)
          ],
        ),
      ]),
    ]);
  }
}

class BuyButton extends StatelessWidget {
  final RaffleModel raffleModel;
  const BuyButton({
    required this.raffleModel,
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned.fill(
                child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 246, 142, 5),
                Color.fromARGB(255, 237, 237, 6),
                Color.fromARGB(255, 246, 142, 5),
              ])),
            )),
            TextButton(
              onPressed: () {
                RaffleService().buyTicket(raffleModel.id);
              },
              child: Text(
                'Comprar',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
    required this.raffle,
  }) : super(key: key);

  final RaffleModel raffle;

  @override
  Widget build(BuildContext context) {
    return Text(
      raffle.title,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}

class Tickets extends StatelessWidget {
  const Tickets({
    Key? key,
    required this.raffle,
  }) : super(key: key);

  final RaffleModel raffle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Tickets'),
        Text(
          '${raffle.participantsUids.length}/${raffle.tickets}',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}

class RafflePrice extends StatelessWidget {
  const RafflePrice({
    Key? key,
    required this.raffle,
  }) : super(key: key);

  final RaffleModel raffle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'S/.',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          '${raffle.price}',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}

class CircleBG extends StatelessWidget {
  final Widget myWidget;
  const CircleBG({Key? key, required this.myWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.yellow,
        shape: BoxShape.rectangle,
      ),
      child: myWidget,
    );
  }
}
