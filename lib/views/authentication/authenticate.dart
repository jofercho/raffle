import 'package:raffle/views/authentication/sign_in.dart';
import 'package:raffle/views/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserModel>();
    print("user.isAuthenticated: " + user.isAuthenticated.toString());
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          !user.isAuthenticated
              ? SignIn()
              : Container(
                  child: ElevatedButton(
                  onPressed: () {
                    user.setAuthenticaded = false;
                  },
                  child: Text('Change'),
                ))
        ],
      ),
    );
  }
}
