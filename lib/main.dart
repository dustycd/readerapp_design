import 'package:flutter/material.dart';
import 'books_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reader app UI',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 240, 94, 16),
      ),
      home: const BooksListPage(), // Default page
    );
  }
}