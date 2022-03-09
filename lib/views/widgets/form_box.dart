import 'package:raffle/common/theme.dart';
import 'package:raffle/views/widgets/custom_auth_button.dart';
import 'package:flutter/material.dart';

class FormBox extends StatefulWidget {
  final List<Widget> inputElements;
  final CustomAuthButton customAuthButton;

  const FormBox(
      {Key? key, required this.inputElements, required this.customAuthButton})
      : super(key: key);

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
              children: widget.inputElements,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: widget.customAuthButton,
          ),
        ],
      ),
    );
  }
}
