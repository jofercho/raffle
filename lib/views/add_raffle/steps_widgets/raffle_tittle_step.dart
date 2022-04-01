import 'package:flutter/material.dart';
import 'package:raffle/model/validation/add_raffle_validation.dart';
import 'package:raffle/views/add_raffle/steps_widgets/raffle_step.dart';

class RaffleTitleStep extends StatelessWidget {
  final AddRaffleValidation addRaffleValidation;

  const RaffleTitleStep({
    Key? key,
    required this.addRaffleValidation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaffleStep<String>(
        label: 'Title',
        hintText: 'Put a tittle to your raffle',
        icon: const Icon(Icons.title),
        addRaffleValidation: addRaffleValidation,
        validation: addRaffleValidation.changeTitle);
  }
}
