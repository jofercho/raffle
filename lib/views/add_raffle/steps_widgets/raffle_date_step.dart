import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:raffle/model/validation/add_raffle_validation.dart';
import 'package:raffle/views/add_raffle/steps_widgets/raffle_step.dart';

class RaffleDateStep extends StatelessWidget {
  final AddRaffleValidation addRaffleValidation;

  const RaffleDateStep({
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
    DateTime selectDate = DateTime.now();
    return Column(
      children: [
        Text(addRaffleValidation.date.value.toString()),
        ElevatedButton(
          child: const Text('Pick a date'),
          onPressed: (() async {
        DateTime? dateTime = await showDatePicker(
            //TODO prevent past dates
            context: context,
            initialDate: selectDate,
            firstDate: DateTime.now().add(const Duration(hours: 1)),
            lastDate: DateTime.now().add(const Duration(days: 360)));
        addRaffleValidation.changeDate(dateTime!);
          }),
        ),
      ],
    );
  }
}
