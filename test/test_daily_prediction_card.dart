import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_response_main.dart';
import 'package:weather_app/modules/dashboard/view_model/dashboard_view_model.dart';
import 'package:weather_app/modules/dashboard/views/items/dashboard_daily_prediction_card.dart';

void main() {
  testWidgets('DashboardDailyPredictionCard should display correct data',
      (WidgetTester tester) async {
    DashboardViewModel mockViewModel = DashboardViewModel();
    mockViewModel.weatherResponseMain = WeatherResponseMain();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider(
            create: (context) => mockViewModel,
            child: DashboardDailyPredictionCard(),
          ),
        ),
      ),
    );
    expect(find.text('Monday'), findsOneWidget);
    expect(find.text('Tuesday'), findsOneWidget);
    expect(find.text('Wednesday'), findsOneWidget);

    expect(find.text('25°'), findsOneWidget);
    expect(find.text('28°'), findsOneWidget);
    expect(find.text('22°'), findsOneWidget);
  });
}
