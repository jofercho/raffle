import 'package:provider/provider.dart';
import 'package:raffle/model/validation/auth_validation.dart';
import 'package:raffle/util/navigation.dart';
import 'package:raffle/views/authentication/auth_title.dart';
import 'package:raffle/views/widgets/custom_auth_button.dart';
import 'package:raffle/views/widgets/custom_auth_link.dart';
import 'package:raffle/views/widgets/form_box.dart';
import 'package:flutter/material.dart';
import 'package:raffle/views/widgets/input_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationValidation authValidation =
        Provider.of<AuthenticationValidation>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AuthenticationTitle(title: "Login"),
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
                hintText: '********',
                fontsize: 22,
                errorText: authValidation.password.error ?? '',
                onChange: (String value) {
                  authValidation.changePassword(value);
                },
              ),
            ],
            customAuthButton:
                CustomAuthButton(submitValidation: authValidation.isValidSignIn),
          ),
          // const SizedBox(height: 40,),
          const CustomAuthLink(
              text: 'Forgot ?',
              aligment: MainAxisAlignment.end,
              linkFunction: onForgot),
          CustomAuthLink(
            text: 'Register',
            aligment: MainAxisAlignment.start,
            linkFunction: () => authValidation.isSigningIn = false,
            color: const Color(0xffe98f60),
          ),
          // const CustomAuthLink(text: 'Register', aligment: MainAxisAlignment.start, linkFunction: onRegister, color: Color(0xffe98f60),),
        ],
      ),
    );
  }
}

onForgot() {
  print('ay me olvide');
}

