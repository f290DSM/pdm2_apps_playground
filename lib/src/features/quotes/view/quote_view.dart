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
  QuoteModel quote = QuoteModel();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadQuote();
  }

  void loadQuote() async {
    setState(() {
      isLoading = true;
    });
    var response = await get(Uri.parse('https://dummyjson.com/quotes/random'));
    setState(() {
      isLoading = false;
    });
    setState(() {
      quote = QuoteModel.fromJson(jsonDecode(response.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote'),
        backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : QuoteCardWidget(quoteModel: quote),
      floatingActionButton: FloatingActionButton.large(
        onPressed: loadQuote,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
