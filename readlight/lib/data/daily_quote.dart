class DailyQuote {
  final String quote;
  final String author;
  final String imageUrl;

  DailyQuote({
    required this.quote,
    required this.author,
    required this.imageUrl,
  });

  factory DailyQuote.fromJson(Map<String, dynamic> json) {
    return DailyQuote(
      quote: json['quote'] as String,
      author: json['author'] as String,
      imageUrl: json['image_url'] as String,
    );
  }
}