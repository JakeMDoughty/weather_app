import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/dashboard/view_model/dashboard_view_model.dart';
import 'package:weather_app/modules/dashboard/views/items/dashboard_hourly_prediction_card.dart';

void main() {
  testWidgets('DashboardHourlyPredictionCard should display correct data',
      (WidgetTester tester) async {
    DashboardViewModel mockViewModel = DashboardViewModel();
    mockViewModel.hourlyTime = ['12:00 PM', '1:00 PM', '2:00 PM'];
    mockViewModel.hourlyWeatherIcons = ['icon1', 'icon2', 'icon3'];
    mockViewModel.hourlyTemperature = ['25', '26', '27'];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider(
            create: (context) => mockViewModel,
            child: DashboardHourlyPredictionCard(),
          ),
        ),
      ),
    );

    expect(find.text('12:00 PM'), findsOneWidget);
    expect(find.text('1:00 PM'), findsOneWidget);
    expect(find.text('2:00 PM'), findsOneWidget);
    expect(find.text('25°'), findsOneWidget);
    expect(find.text('26°'), findsOneWidget);
    expect(find.text('27°'), findsOneWidget);
  });
}
