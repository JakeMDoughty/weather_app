import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/settings.dart';
import 'package:weather_app/modules/settings/view_model/setting_view_model.dart';
import 'package:weather_app/modules/settings/views/Items/setting_toggle_item.dart';

void main() {
  testWidgets('SettingToggleItem should display correct title and toggle state',
      (WidgetTester tester) async {
    Settings mockSettings = Settings(true, 'Test Setting');

    SettingViewModel mockViewModel = SettingViewModel();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider(
            create: (context) => mockViewModel,
            child: SettingToggleItem(mockSettings, 0),
          ),
        ),
      ),
    );
    expect(find.text('Test Setting'), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
    expect(tester.widget<Switch>(find.byType(Switch)).value, true);
    await tester.tap(find.byType(Switch));
    await tester.pump();

    expect(mockViewModel.settings?[0].status, false);
  });
}
