import 'package:flutter/material.dart';
import 'package:raffle/model/validation/add_raffle_validation.dart';

class RaffleStep<T> extends StatelessWidget {
  final String? label;
  final String? hintText;
  final Icon? icon;
  final AddRaffleValidation? addRaffleValidation;
  final Function(T value)? validation;
  final Widget? customForm;

  const RaffleStep({
    Key? key,
    this.label,
    this.hintText,
    this.icon,
    this.addRaffleValidation,
    this.validation,
    this.customForm
  }) : super(key: key);

  // RaffleStep.withForm({Key? key, this.customForm}):super(key: key);

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
              child: customForm ?? TextFormField(
                      initialValue: addRaffleValidation!.title.value ?? '',
                      onChanged: (value) {
                        validation!(value as T);
                      },
                      decoration: InputDecoration(
                        labelText: label,
                        hintText: hintText,
                        icon: icon,
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
