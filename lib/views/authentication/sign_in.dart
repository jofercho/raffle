import 'package:raffle/views/widgets/custom_login_link.dart';
import 'package:raffle/views/widgets/form_box.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Title(title: "Login"),
        const FormBox(isSignUp: false),
        CustomLoginLink(register: false),
        CustomLoginLink(register: true),
      ],
    );
  }
}

class Title extends StatelessWidget {
  final String title;
  
  const Title({Key? key, this.title = ''}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
