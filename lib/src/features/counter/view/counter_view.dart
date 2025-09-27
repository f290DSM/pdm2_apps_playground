import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdm2_apps_playground/src/core/providers/app_providers.dart';
import 'package:pdm2_apps_playground/src/features/counter/view/counter2_view.dart';

class CounterView extends ConsumerStatefulWidget {
  const CounterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterViewState();
}

class _CounterViewState extends ConsumerState<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeSwitchProvider.notifier).update((state) => !state);
            },
            icon: Icon(
              ref.watch(themeSwitchProvider)
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
          PopupMenuButton(
            onSelected: (color) => ref.read(colorProvider.notifier).state = color,
            itemBuilder: (context) {
              return Colors.primaries
                  .map(
                    (color) => PopupMenuItem(                    
                      value: color,
                      child: Icon(Icons.circle, color: color),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${ref.watch(counterProvider)}',
              style: TextStyle(fontSize: 72),
            ),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Counter2View()),
                );
              },
              child: Text('Second View'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
