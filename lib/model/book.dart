import 'package:flutter/material.dart';

class Book {
  final String category;
  final String title;
  final String author;
  final String rating;
  final String reviewsCount;
  final Color imageColor;
  final String imageAsset;   
  final String description;   

  Book({
    required this.category,
    required this.title,
    required this.author,
    required this.rating,
    required this.reviewsCount,
    required this.imageColor,
    required this.imageAsset,
    required this.description,
  });
}

final List<Book> allBooks = [
    Book(
      category: 'Fiction',
      title: 'How Not To Die Alone',
      author: 'Richard Roper',
      rating: '4.63',
      reviewsCount: '375',
      imageColor: Colors.orangeAccent,
      imageAsset: 'lib/assets/Hownottodiealone.png', 
      description: 'A darkly funny and life-affirming debut novel about love and loneliness. Perfect for fans of Eleanor Oliphant Is Completely Fine, it reminds us about the importance of taking chances and seeking connections.', 
    ),
    Book(
      category: 'Dystopia',
      title: 'The Power',
      author: 'Naomi Alderman',
      rating: '4.20',
      reviewsCount: '286',
      imageColor: Colors.redAccent,
      imageAsset: 'lib/assets/the_power.jpeg', 
      description: 'A riveting dystopian story where women develop a mysterious power, changing the balance of the world. This thought-provoking novel explores gender, power, and societal structures.', 
    ),
    Book(
      category: 'Fiction',
      title: 'No Longer Human',
      author: 'Osamu Dazai',
      rating: '4.55',
      reviewsCount: '520',
      imageColor: Colors.blueAccent,
      imageAsset: 'lib/assets/nolonger.jpg',
      description: 'A Japanese classic capturing the struggles of an individual who feels disconnected from society. Intensely personal and poignant, it examines identity, morality, and alienation.',
    ),
    Book(
      category: 'Fiction',
      title: 'Atomic Habits',
      author: 'James Clear',
      rating: '4.80',
      reviewsCount: '1,200',
      imageColor: Colors.greenAccent,
      imageAsset: 'lib/assets/atomic.png',
      description: 'A practical guide to building good habits and breaking bad ones. Clear’s proven methods help you create lasting change and continuous improvement in all areas of your life.',
    ),
    Book(
      category: 'Art',
      title: 'Educated',
      author: 'Tara Westover',
      rating: '4.70',
      reviewsCount: '890',
      imageColor: Colors.purpleAccent,
      imageAsset: 'lib/assets/educated.jpg',
      description: 'A gripping memoir about a young woman who grows up isolated and uneducated, then finds her way to learning and self-discovery. It’s a powerful story of resilience and reinvention.',
    ),
    Book(
      category: 'Design',
      title: 'Sapiens',
      author: 'Yuval Noah Harari',
      rating: '4.65',
      reviewsCount: '2,100',
      imageColor: Colors.tealAccent,
      imageAsset: 'lib/assets/sapiens.png',
      description: 'A groundbreaking narrative of human history, exploring how Homo sapiens became Earth’s dominant species. It challenges our understanding of who we are and where we’re going.',
    ),
  ];