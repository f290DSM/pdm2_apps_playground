import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pdm2_apps_playground/src/core/providers/app_providers.dart';
import 'package:pdm2_apps_playground/src/core/ui/theme.dart';
import 'package:pdm2_apps_playground/src/core/ui/util.dart';
import 'package:pdm2_apps_playground/src/features/counter/view/counter2_view.dart';
import 'package:pdm2_apps_playground/src/features/counter/view/counter_view.dart';
import 'package:pdm2_apps_playground/src/features/home/view/home_view.dart';
import 'package:pdm2_apps_playground/src/features/inputs/inputs_view.dart';
import 'package:pdm2_apps_playground/src/features/quotes/view/quote_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      theme: ThemeData(     
        useMaterial3: false,   
        colorScheme: ColorScheme.fromSwatch(
          brightness: ref.watch(themeSwitchProvider)
              ? Brightness.dark
              : Brightness.light,
          primarySwatch: ref.watch(colorProvider),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeView(),
        '/counter': (context) => CounterView(),
        '/counter2' : (context) => Counter2View(),
        '/quotes' : (context) => QuoteView()
      },
    );
  }
}

final brightnessProvider = StateProvider<Brightness>((ref) => Brightness.light);