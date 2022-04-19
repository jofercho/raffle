import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

getAppTheme(BuildContext context){
  return ThemeData(
    primarySwatch: Colors.yellow,
    textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
  );
}

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
