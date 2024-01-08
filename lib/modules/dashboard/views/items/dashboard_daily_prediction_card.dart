import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/dashboard/view_model/dashboard_view_model.dart';
import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/constants/my_strings.dart';
import 'package:weather_app/support/ui/components/filled_bar_view.dart';
import 'package:weather_app/support/ui/widgets/my_asset_image.dart';
import 'package:weather_app/support/ui/widgets/my_text.dart';

class DashboardDailyPredictionCard extends StatelessWidget {
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
        padding: EdgeInsets.all(k_height_8),
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
                      text: MyString.daysForecast,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: themeBackground,
              thickness: 0.5,
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: model.weatherResponseMain?.daily?.time?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(k_height_6),
                  child: _dayTemperatureView(
                    context,
                    index,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _dayTemperatureView(BuildContext context, int index) {
    final model = Provider.of<DashboardViewModel>(context);
    return Row(
      children: [
        Container(
          width: 100,
          child: MyText(
            text: model.dayName(
              model.weatherResponseMain?.daily?.time?.elementAt(index) ?? "",
            ),
          ),
        ),
        Spacer(),
        MyAssetImage(
          imageName: model.weatherIconNameByCode(
            model.weatherResponseMain?.daily?.weatherCode?.elementAt(index),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: k_height_4,
          ),
          child: MyText(
            text: model.dailyTemperature(
              model.weatherResponseMain?.daily?.temperature2mMin
                      ?.elementAt(index) ??
                  0.0,
            ),
          ),
        ),
        MyText(
          text: '°',
          textStyle: Theme.of(context).textTheme.bodySmall,
        ),
        k_width_gap_6,
        FilledBarView(
          iconData: Icons.star,
          fillPercentage: 0.7,
        ),
        k_width_gap_6,
        Padding(
          padding: EdgeInsets.only(top: k_height_4),
          child: MyText(
            text: model.dailyTemperature(
              model.weatherResponseMain?.daily?.temperature2mMax
                      ?.elementAt(index) ??
                  0.0,
            ),
          ),
        ),
        MyText(
          text: '°',
          textStyle: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
