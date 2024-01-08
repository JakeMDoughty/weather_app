import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/settings/view_model/setting_view_model.dart';
import 'package:weather_app/modules/settings/views/Items/setting_toggle_item.dart';
import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/ui/components/app_bar.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingViewModel(),
      child: Consumer<SettingViewModel>(
        builder: (context, model, _) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Settings',
            ),
            body: _pageContent(model),
          );
        },
      ),
    );
  }

  Widget _pageContent(SettingViewModel model) {
    return Container(
      color: themeBackground,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: model.settings?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(k_height_6),
            child: SettingToggleItem(
              model.settings?.elementAt(index),
              index,
            ),
          );
        },
      ),
    );
  }
}
