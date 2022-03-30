import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:raffle/model/admin_model.dart';
import 'package:raffle/model/validation/validation_item.dart';
import 'package:raffle/services/auth_service.dart';
import 'package:raffle/util/extension_methods.dart';

class AuthenticationValidation extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isSigningIn = true;

  ValidationItem _email = ValidationItem();
  ValidationItem _password = ValidationItem();
  ValidationItem _passwordConfirmation = ValidationItem();

  ValidationItem get email => _email;
  ValidationItem get password => _password;
  ValidationItem get passwordConfirmation => _password;
  bool get isValidSignIn => _email.value != null && _password.value != null;
  bool get isValidSignUp =>
      _email.value != null &&
      _password.value != null &&
      _passwordConfirmation.value != null;
  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    print("changing isSinging in to $isValidSignIn");
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  void changeEmail(String value) {
    _email = value.isValidEmail
        ? ValidationItem(value: value, error: null)
        : ValidationItem(value: null, error: "Invalid email");
    notifyListeners();
  }

  void changePassword(String value) {
    _password = value.isValidPassword
        ? ValidationItem(value: value, error: null)
        : ValidationItem(value: null, error: "Invalid password");
    notifyListeners();
  }

  void changePasswordConfirmation(String value) {
    _passwordConfirmation = value.isValidPassword && value == password.value
        ? ValidationItem(value: value, error: null)
        : ValidationItem(value: null, error: "Invalid password");
    notifyListeners();
  }

  void submitData(BuildContext context) async {
    if (_isSigningIn) {
      await _authService.signIn(email.value!, password.value!);
    } else {
      await _authService.signUp(email.value!, password.value!);
    }

    print(
        "singin: $isSigningIn email: ${email.value} , password ${password.value}");
    AdminModel user = context.read<AdminModel>();
    user.isAuthenticaded = true;
  }

  void test() async {
    _authService.test();
  }
}
