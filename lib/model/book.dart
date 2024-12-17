
import 'dart:ui';

class Book {
  final String category;
  final String title;
  final String author;
  final String rating;
  final String reviewsCount;
  final Color imageColor;

  Book({
    required this.category,
    required this.title,
    required this.author,
    required this.rating,
    required this.reviewsCount,
    required this.imageColor,
  });
}