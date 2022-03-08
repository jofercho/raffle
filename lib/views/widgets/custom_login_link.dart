import 'package:flutter/material.dart';

class CustomLoginLink extends StatefulWidget {
  final bool register;

  CustomLoginLink({Key? key, this.register = true}) : super(key: key) {}

  @override
  State<CustomLoginLink> createState() => _CustomLoginLinkState();
}

class _CustomLoginLinkState extends State<CustomLoginLink> {
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
        Container(
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
      ],
    );
  }
}
