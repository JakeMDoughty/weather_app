import 'package:flutter/material.dart';
import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/ui/widgets/my_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onSettingsPressed;

  CustomAppBar({
    this.title,
    this.onSettingsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: themeBackground, //change your color here
      ),
      title: MyText(
        text: title ?? "",
        textStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        if (onSettingsPressed != null)
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: onSettingsPressed,
            color: themeBackground,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(k_toolbar_height);
}
