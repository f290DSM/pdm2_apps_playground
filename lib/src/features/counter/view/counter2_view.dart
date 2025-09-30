import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdm2_apps_playground/src/features/counter/viewmodel/counter_vm.dart';

class Counter2View extends ConsumerWidget {
  const Counter2View({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Counter 2')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(counter.toString()),
          FilledButton.icon(
            onPressed: () {},
            label: Text('Increment'),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
