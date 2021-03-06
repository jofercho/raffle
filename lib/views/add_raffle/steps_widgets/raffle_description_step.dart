import 'package:flutter/material.dart';
import 'package:raffle/model/validation/add_raffle_validation.dart';
import 'package:raffle/views/add_raffle/steps_widgets/raffle_step.dart';

class RaffleDescriptionStep extends StatelessWidget {
  final AddRaffleValidation addRaffleValidation;

  const RaffleDescriptionStep({
    Key? key,
    required this.addRaffleValidation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaffleStep(customForm: DescriptionForm(addRaffleValidation: addRaffleValidation,));
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
    return TextFormField(
      // initialValue: addRaffleValidation.title.value??'',

      onChanged: (value){
        addRaffleValidation.changeDescription(value);
      },
      keyboardType: TextInputType.multiline,
      minLines: 2,
      maxLines: 5,
      decoration: const InputDecoration(
        labelText: 'Description',
        hintText: 'Describe the raffle',
        icon: Icon(Icons.book),
        isDense: true,
      ),
    );
  }
}
