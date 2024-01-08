import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/location_payload.dart';
import 'package:weather_app/modules/dashboard/view_model/dashboard_view_model.dart';
import 'package:weather_app/modules/dashboard/views/items/dashbord_weather_info_view.dart';

void main() {
  testWidgets('DashboardWeatherInfoView should display correct data',
      (WidgetTester tester) async {
    DashboardViewModel mockViewModel = DashboardViewModel();
    mockViewModel.locationPayload = LocationPayload(
      43.8256988,
      -69.8961389,
      'Location Test',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider(
            create: (context) => mockViewModel,
            child: DashboardWeatherInfoView(),
          ),
        ),
      ),
    );

    expect(find.text('Test Location'), findsOneWidget);
    expect(find.text('25°C'), findsOneWidget);
    expect(find.text('Sunny'), findsOneWidget);
  });
}
