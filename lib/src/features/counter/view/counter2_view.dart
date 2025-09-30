import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdm2_apps_playground/src/features/counter/viewmodel/counter_vm.dart';

class Counter2View extends ConsumerWidget {
  const Counter2View({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterViewModelProvider);
    final vm = ref.read(counterViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Counter 2')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: double.maxFinite),
          Text(counter.toString()),
          FilledButton.icon(
            onPressed: vm.increment,
            label: Text('Increment'),
            icon: Icon(Icons.add),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('VOLTAR'),
          ),
        ],
      ),
    );
  }
}
