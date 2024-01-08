import 'package:weather_app/support/ui/theme.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  const MyTextField({this.focusNode, this.controller});
  @override
  Widget build(BuildContext context) {
    return Material(
      key: Key("MyTextField"),
      color: Colors.transparent,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        enabled: true,
        decoration: textFieldDecoration(""),
      ),
    );
  }
}
