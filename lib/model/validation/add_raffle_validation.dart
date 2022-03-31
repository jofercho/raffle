import 'package:flutter/cupertino.dart';
import 'package:raffle/model/validation/validation_item.dart';
import 'package:raffle/util/extension_methods.dart';

class AddRaffleValidation extends ChangeNotifier {
  ValidationItem _title = ValidationItem<String>();
  ValidationItem _description = ValidationItem<String>();
  ValidationItem _price = ValidationItem<double>();
  ValidationItem _tickets = ValidationItem<int>();
  ValidationItem _date = ValidationItem<DateTime>();

  get title => _title;
  get description => _description;
  get price => _price;
  get tickets => _tickets;
  get date => _date;

  changeTitle(String value) {
    _title = value.isValidName
        ? ValidationItem(value: value, error: null)
        : ValidationItem(value: null, error: "Invalid Title");
  }

  changeDescription(String value) {
    _description = ValidationItem(value:value, error: null);
  }

  changePrice(int value) {
    _price = ValidationItem(value:value, error: null);
  }

  changeTickets(String value) {
    _tickets = ValidationItem(value:value, error: null);
  }


  changeDate(String value) {
    _date = ValidationItem(value:value, error: null);
  }
}
