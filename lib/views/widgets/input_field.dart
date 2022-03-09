import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String errorText;
  // final String hintText;
  final double? fontsize;
  final void Function(String)? onChange;

  const InputField({
    Key? key, this.hintText = 'Input', this.fontsize, this.errorText = 'Error', this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 32),
      child: TextField(
        onChanged: onChange,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: fontsize),
          border: InputBorder.none,
          icon: const Icon(Icons.account_circle_rounded),
          hintText: hintText,
          errorText: errorText
        ),
      ),
    );
  }
}