import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdm2_apps_playground/src/features/quotes/model/quote_model.dart';

class QuoteCardWidget extends StatelessWidget {
  const QuoteCardWidget({super.key, required this.quoteModel});

  final QuoteModel quoteModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(quoteModel.quote!, style: GoogleFonts.righteous(fontSize: 28)),
              Text(quoteModel.author!, style: GoogleFonts.lato(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
