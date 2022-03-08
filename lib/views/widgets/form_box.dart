import 'package:raffle/common/theme.dart';
import 'package:raffle/views/widgets/custom_login_button.dart';
import 'package:raffle/views/widgets/input_field.dart';
import 'package:flutter/material.dart';

class FormBox extends StatefulWidget {
  final bool isSignIn;

  const FormBox({
    Key? key, required this.isSignIn
  }) : super(key: key);

  @override
  State<FormBox> createState() => _FormBoxState();
}

class _FormBoxState extends State<FormBox> {
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          Container(
            height: 150,
            margin: const EdgeInsets.only(
              right: 70,
            ),
            decoration: inputBoxDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                InputField(
                  hintText: 'User Email',
                  fontsize: 20,
                ),
                InputField(
                  hintText: '********',
                  fontsize: 22,
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: CustomLoginButton(),
          ),
        ],
      ),
    );
  }
}

