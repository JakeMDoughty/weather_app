import 'package:weather_app/support/constants/my_strings.dart';
import 'package:weather_app/support/ui/theme.dart';
import 'package:weather_app/support/ui/widgets/my_text.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function(String)? onClick;
  final ButtonStyle? style;
  final bool isHighlighted;

  const MyButton({
    required this.text,
    this.style,
    this.onClick,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: Key("MyButton"),
      onPressed: onClick == null ? null : () => this.onClick!(text),
      style: onClick == null
          ? disableButtonStyle
          : style != null
              ? isHighlighted
                  ? normalButtonStyle2_Active
                  : style
              : normalButtonStyle1,
      child: Text(
        text,
      ),
    );
  }
}
