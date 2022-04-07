import 'package:flutter/material.dart';
import 'package:raffle/model/validation/add_raffle_validation.dart';
import 'package:raffle/views/add_raffle/steps_widgets/raffle_step.dart';

class RafflePriceStep extends StatelessWidget {
  final AddRaffleValidation addRaffleValidation;

  const RafflePriceStep({
    Key? key,
    required this.addRaffleValidation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaffleStep(
      customForm: PriceForm(addRaffleValidation: addRaffleValidation),
    );
  }
}

class PriceForm extends StatelessWidget {
  const PriceForm({
    Key? key,
    required this.addRaffleValidation,
  }) : super(key: key);

  final AddRaffleValidation addRaffleValidation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: addRaffleValidation.price.value == null
          ? ''
          : addRaffleValidation.price.value.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          addRaffleValidation.changePrice(double.parse(value));
        }
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Price',
        hintText: 'Put the price of a ticket',
        icon: Icon(Icons.price_change),
        isDense: true,
      ),
    );
  }
}
