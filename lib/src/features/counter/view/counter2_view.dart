import 'package:flutter/material.dart';
import 'package:pdm2_apps_playground/src/core/providers/app_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter2View extends ConsumerWidget {
  const Counter2View({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${ref.watch(counterProvider)}', style: TextStyle(fontSize: 72)),
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
