import 'package:flutter/material.dart';
import 'package:pdm2_apps_playground/src/features/quotes/view/quote_view.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.deepOrange),
      home: QuoteView(),
    );
  }
}
