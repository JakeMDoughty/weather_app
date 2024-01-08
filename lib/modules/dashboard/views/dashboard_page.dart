import 'package:weather_app/modules/dashboard/view_model/dashboard_view_model.dart';
import 'package:weather_app/modules/dashboard/views/items/dashboard_daily_prediction_card.dart';
import 'package:weather_app/modules/dashboard/views/items/dashboard_hourly_prediction_card.dart';
import 'package:weather_app/modules/dashboard/views/items/dashbord_weather_info_view.dart';
import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/enums/e_view_state.dart';
import 'package:weather_app/support/routing/routes.dart';
import 'package:weather_app/support/ui/components/app_bar.dart';
import 'package:weather_app/support/ui/components/error_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/support/ui/components/loader_view.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _model = DashboardViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _model,
      child: Consumer<DashboardViewModel>(
        builder: (context, model, _) {
          return Scaffold(
            appBar: CustomAppBar(
              onSettingsPressed: () => Routes.navigateTo(
                settings,
                onBackPressed: () => _model.update,
              ),
            ),
            body: _pageContent(model),
          );
        },
      ),
    );
  }

  // this method will always use to render page data
  Widget _pageContent(DashboardViewModel model) {
    switch (model.state) {
      case EViewState.error:
        return ErrorView(model.errorMessage, refreshFunction: model.fetchData);
      case EViewState.complete:
        return SingleChildScrollView(
          child: Column(
            children: [
              /// info view
              DashboardWeatherInfoView(),
              k_height_gap_8,

              /// hourly card
              Padding(
                padding: EdgeInsets.all(k_height_8),
                child: DashboardHourlyPredictionCard(),
              ),

              /// daily card
              Padding(
                padding: EdgeInsets.all(k_height_8),
                child: DashboardDailyPredictionCard(),
              ),
            ],
          ),
        );
      default:
        return LoaderView();
    }
  }
}
