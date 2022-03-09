import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle/model/validation/auth_validation.dart';
import 'package:raffle/views/authentication/auth_title.dart';
import 'package:raffle/views/widgets/custom_auth_button.dart';
import 'package:raffle/views/widgets/custom_auth_link.dart';
import 'package:raffle/views/widgets/form_box.dart';
import 'package:raffle/views/widgets/input_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationValidation authValidation =
        Provider.of<AuthenticationValidation>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AuthenticationTitle(title: "Sing Up"),
        FormBox(
          inputElements: [
            InputField(
              hintText: 'User Email',
              fontsize: 20,
              errorText: authValidation.email.error ?? '',
              onChange: (String value) {
                authValidation.changeEmail(value);
              },
            ),
            InputField(
              hintText: 'password',
              fontsize: 22,
              errorText: authValidation.password.error ?? '',
              onChange: (String value) {
                authValidation.changePassword(value);
              },
            ),
            InputField(
              hintText: 'password confirmation',
              fontsize: 22,
              errorText: authValidation.passwordConfirmation.error ?? '',
              onChange: (String value) {
                authValidation.changePasswordConfirmation(value);
              },
            ),
          ],
          customAuthButton:
              CustomAuthButton(submitValidation: authValidation.isValidSignUp),
        ),
        CustomAuthLink(register: true),
      ],
    );
  }
}
