import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:raffle/model/validation/add_raffle_validation.dart';
import 'package:raffle/views/add_raffle/steps_widgets/raffle_step.dart';

class RaffleTicketsStep extends StatelessWidget {
  final AddRaffleValidation addRaffleValidation;

  const RaffleTicketsStep({
    Key? key,
    required this.addRaffleValidation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaffleStep(
        customForm: DescriptionForm(
      addRaffleValidation: addRaffleValidation,
    ));
  }
}

class DescriptionForm extends StatelessWidget {
  const DescriptionForm({
    Key? key,
    required this.addRaffleValidation,
  }) : super(key: key);

  final AddRaffleValidation addRaffleValidation;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
        minValue: 0,
        maxValue: 100,
        value: addRaffleValidation.tickets.value??0,
        onChanged: (value){
          addRaffleValidation.changeTickets(value);
          });
  }
}
