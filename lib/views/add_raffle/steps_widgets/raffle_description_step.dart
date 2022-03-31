import 'package:flutter/material.dart';
import 'package:raffle/model/validation/add_raffle_validation.dart';

class RaffleDescriptionStep extends StatelessWidget {
  final AddRaffleValidation addRaffleValidation;

  const RaffleDescriptionStep({
    Key? key,
    required this.addRaffleValidation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: TextFormField(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
