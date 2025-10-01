import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:pdm2_apps_playground/src/features/quotes/model/quote_model.dart';
import 'package:pdm2_apps_playground/src/features/quotes/view/widget/quote_card_widget.dart';

class QuoteView extends ConsumerStatefulWidget {
  const QuoteView({super.key});

  @override
  ConsumerState<QuoteView> createState() => _QuoteViewState();
}

class _QuoteViewState extends ConsumerState<QuoteView> {
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

  Future<List<QuoteModel>> getQuotes() async {
    var response = await get(Uri.parse('https://dummyjson.com/quotes'));
    return (jsonDecode(response.body)['quotes'] as List)
        .map((e) => QuoteModel.fromJson(e))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quotes')),
      body: FutureBuilder(
        future: getQuotes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return ListView(
            children: [
              for (var quote in snapshot.data!)
                QuoteCardWidget(quoteModel: quote),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: loadQuote,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
