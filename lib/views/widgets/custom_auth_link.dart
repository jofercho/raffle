import 'package:flutter/material.dart';

class CustomAuthLink extends StatefulWidget {
  final String text;
  final MainAxisAlignment aligment;
  final Color color; 
  final void Function() linkFunction;

  const CustomAuthLink(
      {Key? key,
      this.aligment = MainAxisAlignment.start,
      this.color = const Color.fromARGB(255, 126, 122, 122),
      required this.text,
      required this.linkFunction})
      : super(key: key);

  @override
  State<CustomAuthLink> createState() => _CustomAuthLinkState();
}

class _CustomAuthLinkState extends State<CustomAuthLink> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.aligment,
      children: [
        GestureDetector(
          onTap: widget.linkFunction,
          child: Container(
            margin: const EdgeInsets.only(right: 16, left: 16, top: 16),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: widget.color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
