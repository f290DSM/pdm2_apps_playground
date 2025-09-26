import 'dart:developer';

import 'package:flutter/material.dart';

class InputsView extends StatefulWidget {
  const InputsView({super.key});

  @override
  State<InputsView> createState() => _InputsViewState();
}

class _InputsViewState extends State<InputsView> {
  bool switchValue = false;
  double sliderValue = 0;
  String text = '';
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inputs")),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView(
          children: [
            FilledButton(onPressed: () {}, child: Text("Filled Button")),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Filled Button Icon"),
            ),
            FilledButton.tonal(
              onPressed: () {},
              child: Text("Filled Button Tonal"),
            ),
            FilledButton.tonalIcon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Filled Button Tonal Icon"),
            ),
            OutlinedButton(onPressed: () {}, child: Text("Outlined Button")),
            TextButton(onPressed: () {}, child: Text('Text Button')),
            UnconstrainedBox(
              child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ),
            Switch(
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
              value: switchValue,
            ),
            Slider(
              min: 0,
              max: 10,
              divisions: 10,
              label: sliderValue.round().toString(),
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'TextField', filled: true),
              onChanged: (value) {
                // setState(() {
                  text = value;
                  log('onChanged: $text');
                // });
              },
              onSubmitted: (value) {
                log('onSubmitted: $text');
              },
              onEditingComplete: () {
                log('onEditingComplete: $text');
              },
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                text = controller.text;
              });
            }, child: Text('SALVAR')),
            Text(text),
          ],
        ),
      ),
    );
  }
}
