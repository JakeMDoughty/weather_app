import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/dashboard/view_model/dashboard_view_model.dart';
import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/constants/my_strings.dart';
import 'package:weather_app/support/ui/widgets/my_asset_image.dart';
import 'package:weather_app/support/ui/widgets/my_text.dart';

class DashboardHourlyPredictionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DashboardViewModel>(context);

    return Card(
      color: themeLight,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(k_height_4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: k_height_4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  k_width_gap_6,
                  Padding(
                    padding: EdgeInsets.only(top: k_height_2),
                    child: Icon(
                      FontAwesomeIcons.clock,
                      size: 12.0,
                      color: themeBackground,
                    ),
                  ),
                  k_width_gap_6,
                  Flexible(
                    child: MyText(
                      text: MyString.hourlyForecast,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: themeBackground,
              thickness: 0.5,
            ),
            Container(
              height: 100.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: model.hourlyTime?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(k_height_6),
                    child: _dayTemperatureView(context, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _dayTemperatureView(
    BuildContext context,
    int index,
  ) {
    final model = Provider.of<DashboardViewModel>(context);
    return Column(
      children: [
        MyText(
          text: index == 0 ? "Now" : "${model.hourlyTime?.elementAt(index)}",
        ),
        k_height_gap_6,
        MyAssetImage(
          imageName: model.hourlyWeatherIcons?.elementAt(index) ?? "",
        ),
        k_height_gap_6,
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(top: k_height_4),
                child: MyText(
                  text: model.hourlyTemperature?.elementAt(index) ?? "",
                )),
            MyText(
              text: '°',
              textStyle: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
