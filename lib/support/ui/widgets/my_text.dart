import 'package:weather_app/support/constants/my_strings.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Function(String)? onClick;
  final TextAlign? textAlign;

  const MyText(
      {required this.text, this.textStyle, this.textAlign, this.onClick});

  @override
  Widget build(BuildContext context) {
    if (onClick == null) {
      return Text(
        key: Key("MyText"),
        MyString.translate(text),
        textAlign: textAlign ?? TextAlign.start,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        softWrap: true,
      );
    }
    return MouseRegion(
      key: Key("MyText"),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => this.onClick!(text),
        child: Tooltip(
          message: MyString.translate(text),
          child: Text(
            MyString.translate(text),
            style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
