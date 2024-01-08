import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/location_payload.dart';
import 'package:weather_app/modules/dashboard/view_model/dashboard_view_model.dart';
import 'package:weather_app/modules/dashboard/views/dialog/location_change_dialog.dart';
import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/constants/my_strings.dart';
import 'package:weather_app/support/ui/widgets/my_text.dart';

class DashboardWeatherInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DashboardViewModel>(context);
    model.filterHourlyData();
    return Column(
      children: [
        MyText(
          text: MyString.myLocation,
          textStyle: Theme.of(context).textTheme.titleMedium,
        ),
        k_height_gap_4,
        GestureDetector(
          onTap: () async {
            final response = await showDialog<LocationPayload>(
                context: context,
                builder: (BuildContext context) => LocationChangeDialog());

            if (response != null) model.updateLocationAndPref(response);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: (model.locationPayload?.locationName ?? "Unknown")
                    .toUpperCase(),
              ),
              Icon(
                FontAwesomeIcons.mapPin,
                size: 16.0, // Set the desired size for the icon
                color: themeBackground, // Set the desired color for the icon
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: k_height_8),
              child: MyText(
                text: model.currentTemperature,
                textStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            MyText(
              text: '°',
              textStyle: Theme.of(context).textTheme.bodySmall,
            ),
            MyText(
              text: model.CentOrFarText,
              textStyle: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        MyText(
          text: model.currentForcast,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
