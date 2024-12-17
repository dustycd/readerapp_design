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
        primaryColor: Colors.orange,
      ),
      home: const BooksListPage(), // Default page
    );
  }
}