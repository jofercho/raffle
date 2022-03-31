import 'package:flutter/material.dart';
import 'package:raffle/model/validation/add_raffle_validation.dart';

class RaffleTitleStep extends StatelessWidget {
  final AddRaffleValidation addRaffleValidation;
  
  const RaffleTitleStep({
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
                initialValue: addRaffleValidation.title.value??'',
                onChanged: (value){
                  addRaffleValidation.changeTitle(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Put a tittle to your raffle',
                  icon: Icon(Icons.title),
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
