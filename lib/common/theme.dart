import 'package:flutter/material.dart';

final appTheme = ThemeData(
    primarySwatch: Colors.yellow,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: 'Corben',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Colors.black,
      ),
    ));

final inputBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: const BorderRadius.only(
    topRight: Radius.circular(100),
    bottomRight: Radius.circular(100),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 0,
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ],
);
