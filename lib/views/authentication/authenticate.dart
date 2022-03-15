import 'package:raffle/model/validation/auth_validation.dart';
import 'package:raffle/views/authentication/sign_in.dart';
import 'package:raffle/views/authentication/sign_up.dart';
import 'package:raffle/views/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle/views/raffle.dart';
import 'package:raffle/views/raffle_list/raffle_list.dart';

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
          if (user.isAuthenticated) ...[
            Container(child: Raffle(),)
          ] else ...[
            Background(),
            auth.isSigningIn ? SignIn() : SignUp()
          ]
        ],
      ),
    );
  }
}
