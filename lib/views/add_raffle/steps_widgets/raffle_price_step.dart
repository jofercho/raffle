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
    return RaffleStep(customForm: PriceForm(addRaffleValidation: addRaffleValidation),);
    // return Padding(
    //   padding: const EdgeInsets.all(16),
    //   child: Material(
    //     elevation: 1,
    //     clipBehavior: Clip.antiAlias,
    //     borderRadius: BorderRadius.circular(8),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
    //           child: PriceForm(addRaffleValidation: addRaffleValidation),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
      initialValue: addRaffleValidation.price.value??'',
      onChanged: (value){
        addRaffleValidation.changeTitle(value);
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
