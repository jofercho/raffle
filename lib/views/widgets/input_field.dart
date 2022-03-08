import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final double? fontsize;

  const InputField({
    Key? key, this.hintText = 'Input', this.fontsize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 32),
      child: TextField(
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: fontsize),
          border: InputBorder.none,
          icon: const Icon(Icons.account_circle_rounded),
          hintText: hintText,
        ),
      ),
    );
  }
}