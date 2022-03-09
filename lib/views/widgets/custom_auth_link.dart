import 'package:flutter/material.dart';

class CustomAuthLink extends StatefulWidget {
  final bool register;
  final void Function() linkFunction;

  CustomAuthLink({Key? key, this.register = true, required this.linkFunction}) : super(key: key) {}

  @override
  State<CustomAuthLink> createState() => _CustomAuthLinkState();
}

class _CustomAuthLinkState extends State<CustomAuthLink> {
  late MainAxisAlignment mainAxisAlignment;
  late String title;
  late Color color;

  @override
  void initState() {
    if (widget.register) {
      mainAxisAlignment = MainAxisAlignment.start;
      title = 'Register';
      color = const Color(0xffe98f60);
      return;
    }
    mainAxisAlignment = MainAxisAlignment.end;
    title = 'Forgot ?';
    color = Colors.grey.shade400;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        GestureDetector(
          onTap: widget.linkFunction,
          child: Container(
            margin: const EdgeInsets.only(right: 16, top: 16),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
