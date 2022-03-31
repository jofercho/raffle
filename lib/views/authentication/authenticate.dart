import 'package:raffle/model/validation/auth_validation.dart';
import 'package:raffle/views/authentication/sign_in.dart';
import 'package:raffle/views/authentication/sign_up.dart';
import 'package:raffle/views/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle/views/raffle.dart';

import '../../model/admin_model.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdminModel user = context.watch<AdminModel>();
    AuthenticationValidation auth = context.watch<AuthenticationValidation>();
    return Scaffold(
      body: Stack(
        children: [
          if (user.isAuthenticated) ...[
            Raffle()
          ] else ...[
            Background(),
            auth.isSigningIn ? const SignIn() : const SignUp()
          ]
        ],
      ),
    );
  }
}
