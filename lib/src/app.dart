import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pdm2_apps_playground/src/core/providers/app_providers.dart';
import 'package:pdm2_apps_playground/src/core/ui/theme.dart';
import 'package:pdm2_apps_playground/src/core/ui/util.dart';
import 'package:pdm2_apps_playground/src/features/counter/view/counter_view.dart';
import 'package:pdm2_apps_playground/src/features/inputs/inputs_view.dart';
import 'package:pdm2_apps_playground/src/features/quotes/view/quote_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Noto Sans", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);

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
      // theme: ThemeData(colorSchemeSeed: Colors.amber),
      // theme: ref.watch(themeSwitchProvider)
      //     ? theme.light()
      //     : theme.dark(),
      home: CounterView(),
    );
  }
}

final brightnessProvider = StateProvider<Brightness>((ref) => Brightness.light);