import 'package:flutter/material.dart';

class AuthenticationTitle extends StatelessWidget {
  final String title;
  
  const AuthenticationTitle({Key? key, this.title = ''}):super(key: key);

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