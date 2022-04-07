import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle/model/add_raffle/add_raffle_model.dart';
import 'package:raffle/model/validation/add_raffle_validation.dart';
import 'package:raffle/util/extension_methods.dart';
import 'package:raffle/views/add_raffle/steps_widgets/raffle_date_step.dart';
import 'package:raffle/views/add_raffle/steps_widgets/raffle_description_step.dart';
import 'package:raffle/views/add_raffle/steps_widgets/raffle_picture_step.dart';
import 'package:raffle/views/add_raffle/steps_widgets/raffle_price_step.dart';
import 'package:raffle/views/add_raffle/steps_widgets/raffle_tickets_step.dart';
import 'package:raffle/views/add_raffle/steps_widgets/raffle_tittle_step.dart';

enum AddRaffleSteps { picture, title, description, price, tickets, date }

class AddRaffle extends StatelessWidget {
  const AddRaffle({Key? key}) : super(key: key);

  _getTittle(AddRaffleModel addRaffleModel, AddRaffleSteps step) {
    return addRaffleModel.index == step.index
        ? Text(step.name.toCapitalized())
        : const Text('');
  }

  @override
  Widget build(BuildContext context) {
    AddRaffleValidation addRaffleValidation =
        context.watch<AddRaffleValidation>();
    AddRaffleModel addRaffleModel = context.watch<AddRaffleModel>();
    List<Step> steps = [
      Step(
        isActive: addRaffleModel.index >= AddRaffleSteps.picture.index,
        title: _getTittle(addRaffleModel, AddRaffleSteps.picture),
        content: RafflePictureStep(
          addRaffleValidation: addRaffleValidation,
        ),
      ),
      Step(
        isActive: addRaffleModel.index >= AddRaffleSteps.title.index,
        title: _getTittle(addRaffleModel, AddRaffleSteps.title),
        content: RaffleTitleStep(addRaffleValidation: addRaffleValidation),
      ),
      Step(
        isActive: addRaffleModel.index >= AddRaffleSteps.description.index,
        title: _getTittle(addRaffleModel, AddRaffleSteps.description),
        content:
            RaffleDescriptionStep(addRaffleValidation: addRaffleValidation),
      ),
      Step(
        isActive: addRaffleModel.index >= AddRaffleSteps.price.index,
        title: _getTittle(addRaffleModel, AddRaffleSteps.price),
        content: RafflePriceStep(addRaffleValidation: addRaffleValidation),
      ),
      Step(
        isActive: addRaffleModel.index >= AddRaffleSteps.tickets.index,
        title: _getTittle(addRaffleModel, AddRaffleSteps.tickets),
        content: RaffleTicketsStep(
          addRaffleValidation: addRaffleValidation,
        ),
      ),
      Step(
        isActive: addRaffleModel.index >= AddRaffleSteps.date.index,
        title: _getTittle(addRaffleModel, AddRaffleSteps.date),
        content: RaffleDateStep(addRaffleValidation: addRaffleValidation),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Raffle'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: steps,
        currentStep: addRaffleModel.index,
        onStepContinue: () {
          if (addRaffleModel.index < steps.length - 1) {
            String? error =
                addRaffleValidation.getByIndex(addRaffleModel.index).error;
            if (error == null) {
              addRaffleModel.index++;
              return;
            }
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(error),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'))
                      ],
                    ));
          }
          if (addRaffleModel.index == steps.length - 1) {
            addRaffleValidation.submit();
            Navigator.pop(context);
          }
        },
        onStepCancel: () {
          if (addRaffleModel.index > 0) addRaffleModel.index--;
        },
        onStepTapped: (int index) {
          addRaffleModel.index = index;
        },
      ),
    );
  }
}
