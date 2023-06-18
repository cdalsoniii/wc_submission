import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '/components/weather_data_entry_widget.dart';
import '/components/weather_stats_component_widget.dart';
import 'package:markov2/flutter_flow/flutter_flow_icon_button.dart';
import 'package:markov2/flutter_flow/flutter_flow_theme.dart';
import 'package:markov2/flutter_flow/flutter_flow_util.dart';
import 'package:markov2/flutter_flow/flutter_flow_widgets.dart';
import 'package:provider/provider.dart';
import 'package:markov2/pages/weather/weather_model.dart';
export 'package:markov2/pages/weather/weather_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('WeatherWidget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WeatherWidget(),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(Column), findsNWidgets(2));
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(Align), findsOneWidget);
    expect(find.byType(FFButtonWidget), findsOneWidget);
    expect(find.byType(Flexible), findsOneWidget);
    expect(find.byType(WeatherStatComponentWidget), findsOneWidget);
  });

  testWidgets('WeatherDataEntryWidget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WeatherDataEntryWidget(),
        ),
      ),
    );

    expect(find.byType(Padding), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
  });

  testWidgets('WeatherStatComponentWidget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WeatherStatComponentWidget(),
        ),
      ),
    );

    expect(find.byType(Padding), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(Wrap), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
  });

  testWidgets('WeatherWidget Button Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WeatherWidget(),
      ),
    );

    final buttonFinder = find.byType(FFButtonWidget);
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    final response = http.Response(jsonEncode({'key': 'value'}), 200);
    http.Client().post = (_) async => response;

    expect(find.text('todaysHigh: '), findsOneWidget);
    expect(find.text('todaysLow: '), findsOneWidget);
    expect(find.text('todaysChanceOfRainfall: '), findsOneWidget);
    expect(find.text('todaysCondition: '), findsOneWidget);
    expect(find.text('uv: '), findsOneWidget);
  });
}
