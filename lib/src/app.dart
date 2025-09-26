import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pdm2_apps_playground/src/core/ui/theme.dart';
import 'package:pdm2_apps_playground/src/core/ui/util.dart';
import 'package:pdm2_apps_playground/src/features/inputs/inputs_view.dart';
import 'package:pdm2_apps_playground/src/features/quotes/view/quote_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Noto Sans", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.amber),
      // theme: ref.watch(brightnessProvider) == Brightness.light
      //     ? theme.light()
      //     : theme.dark(),
      home: InputsView(),
    );
  }
}

final brightnessProvider = StateProvider<Brightness>((ref) => Brightness.light);
final colorProvider = StateProvider<Color>((ref) => Colors.black);