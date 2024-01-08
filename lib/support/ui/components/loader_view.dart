import 'package:flutter/material.dart';
import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/ui/widgets/my_text.dart';

class LoaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: themeLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(themeBackground),
              ),
              SizedBox(height: 16),
              MyText(
                text: 'Loading...',
                textStyle: TextStyle(color: themeBackground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
