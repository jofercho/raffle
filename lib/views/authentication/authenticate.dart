import 'package:raffle/model/validation/auth_validation.dart';
import 'package:raffle/views/authentication/sign_in.dart';
import 'package:raffle/views/authentication/sign_up.dart';
import 'package:raffle/views/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserModel>();
    AuthenticationValidation auth = context.watch<AuthenticationValidation>();
    // print("user.isAuthenticated: " + user.isAuthenticated.toString());
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          // !user.isAuthenticated
          auth.isSigningIn
              ? SignIn()
              : SignUp()
        ],
      ),
    );
  }
}
