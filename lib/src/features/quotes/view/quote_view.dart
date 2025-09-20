import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pdm2_apps_playground/src/features/quotes/model/quote_model.dart';
import 'package:pdm2_apps_playground/src/features/quotes/view/widget/quote_card_widget.dart';

class QuoteView extends StatefulWidget {
  const QuoteView({super.key});

  @override
  State<QuoteView> createState() => _QuoteViewState();
}

class _QuoteViewState extends State<QuoteView> {
  var quote = QuoteModel(
    id: 1,
    quote:
        'Mussum ipsum cacildis vidis litrus abertis. Mussum ipsum cacildis vidis litrus abertis.',
    author: 'Mussun',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quote')),
      body: Center(child: QuoteCardWidget(quoteModel: quote)),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async {
          var response = await get(Uri.parse('https://dummyjson.com/quotes/random'));          
          setState(() {
            quote = QuoteModel.fromJson(jsonDecode(response.body));
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
