import 'package:firebase_auth/firebase_auth.dart';
import 'package:raffle/model/validation/auth_validation.dart';
import 'package:raffle/views/authentication/sign_in.dart';
import 'package:raffle/views/authentication/sign_up.dart';
import 'package:raffle/views/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle/views/raffle.dart';


class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationValidation auth = context.watch<AuthenticationValidation>();
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
              return Raffle();
            } else {
              return Stack(children: [
                Background(),
                auth.isSigningIn ? const SignIn() : const SignUp()
              ]);
            }
          }),
    );
  }
}
