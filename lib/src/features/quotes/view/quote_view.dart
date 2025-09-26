import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:pdm2_apps_playground/src/app.dart';
import 'package:pdm2_apps_playground/src/features/quotes/model/quote_model.dart';
import 'package:pdm2_apps_playground/src/features/quotes/view/widget/quote_card_widget.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote'),
        // backgroundColor: Theme.of(context).colorScheme.primaryFixed,
        actions: [
          IconButton(
            icon: Icon(
              ref.watch(brightnessProvider) == Brightness.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              ref
                  .read(brightnessProvider.notifier)
                  .update(
                    (state) => state == Brightness.light
                        ? Brightness.dark
                        : Brightness.light,
                  );
            },
          ),
        ],
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
