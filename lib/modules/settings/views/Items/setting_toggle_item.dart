import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/settings.dart';
import 'package:weather_app/modules/dashboard/view_model/dashboard_view_model.dart';
import 'package:weather_app/modules/settings/view_model/setting_view_model.dart';
import 'package:weather_app/support/ui/widgets/my_text.dart';

class SettingToggleItem extends StatelessWidget {
  final Settings? settings;
  final int? index;

  SettingToggleItem(
    this.settings,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            text: settings?.title ?? "",
            textStyle: Theme.of(context).textTheme.labelMedium,
          ),
          Switch(
            value: settings?.status ?? false,
            onChanged: (value) {
              model.toggle(index ?? 0);
            },
          ),
        ],
      ),
    );
  }
}
