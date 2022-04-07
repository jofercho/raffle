import 'package:flutter/cupertino.dart';
import 'package:raffle/model/validation/validation_item.dart';
import 'package:raffle/services/raffle_service.dart';
import 'package:raffle/util/extension_methods.dart';

class AddRaffleValidation extends ChangeNotifier {
  final RaffleService _raffleService = RaffleService();

  var validationItems = [
    ValidationItem<String>(error: "Picture is missing"),
    ValidationItem<String>(error: "Title is missing"),
    ValidationItem<String>(error: "Description is missing"),
    ValidationItem<double>(error: "Price is missing"),
    ValidationItem<int>(value: 0, error: "Tickets is missing"),
    ValidationItem<DateTime>(error: "Date is missing"),
  ];

  get picture => validationItems[0];
  get title => validationItems[1];
  get description => validationItems[2];
  get price => validationItems[3];
  get tickets => validationItems[4];
  get date => validationItems[5];

  getByIndex(int index) => validationItems[index];

  changePicture(String value) {
    validationItems[0] = ValidationItem(value: value, error: null);
    notifyListeners();
  }
  
  changeTitle(String value) {
    // _title = value.isValidName
    //     ? ValidationItem(value: value, error: null)
    //     : ValidationItem(value: null, error: "Invalid Title");
    validationItems[1] = ValidationItem(value: value, error: null);
  }

  changeDescription(String value) {
    validationItems[2] = ValidationItem(value: value, error: null);
  }

  changePrice(double value) {
    validationItems[3] = ValidationItem(value: value, error: null);
  }

  changeTickets(int value) {
    validationItems[4] = ValidationItem(value: value, error: null);
    notifyListeners();
  }

  changeDate(DateTime value) {
    validationItems[5] = ValidationItem(value: value, error: null);
    notifyListeners();
  }

  submit() {
    _raffleService.createRaffle(
      title.value,
      description.value,
      picture.value,
      price.value,
      tickets.value,
      date.value,
    );
  }
}
