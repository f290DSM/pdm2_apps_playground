import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdm2_apps_playground/src/core/providers/app_providers.dart';

class SecondView extends ConsumerWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Second View')),
      body: Center(child: Text(ref.watch(primeiroProvider))),
    );
  }
}
