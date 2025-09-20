class QuoteModel {
  int? id;
  String? quote;
  String? author;

  QuoteModel({this.id, this.quote, this.author});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    quote = json['quote'] ?? 'Empty';
    author = json['author'] ?? 'No Author';
  }
  
}
