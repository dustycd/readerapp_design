import 'package:flutter/material.dart';
import 'model/book.dart';

class BookDetailsPage extends StatefulWidget {
  final Book book;
  const BookDetailsPage({super.key, required this.book});

  @override
  BookDetailsPageState createState() => BookDetailsPageState();
}

class BookDetailsPageState extends State<BookDetailsPage> {
  final Color topBackgroundColor = const Color(0xFFAEE1E1);

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    
    return Scaffold(
      backgroundColor: topBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top icons row (arrow on left, bookmark on right)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border, color: Colors.white),
                    onPressed: () {
                      // Handle bookmark action if needed
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // White container filling the rest of the screen
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Use SingleChildScrollView inside so content can scroll if needed.
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Text(
                                book.title,
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  height: 1.3,
                                ),
                              ),
                              const SizedBox(height: 5),

                              // Author
                              Text(
                                book.author,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  height: 1.3,
                                ),
                              ),
                              const SizedBox(height: 15),

                              // Rating & Reviews
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star, size: 20, color: Colors.orangeAccent),
                                  const Icon(Icons.star, size: 20, color: Colors.orangeAccent),
                                  const Icon(Icons.star, size: 20, color: Colors.orangeAccent),
                                  const Icon(Icons.star, size: 20, color: Colors.orangeAccent),
                                  const Icon(Icons.star_half, size: 20, color: Colors.orangeAccent),
                                  const SizedBox(width: 8),
                                  Text(
                                    book.rating,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.person, size: 18, color: Colors.grey),
                                  const SizedBox(width: 6),
                                  Text(
                                    '${book.reviewsCount} Reviews',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),
                              Container(height: 1, color: Colors.grey.shade300),
                              const SizedBox(height: 20),

                              // Description
                              const Text(
                                'Smart, darkly funny, and life-affirming, How Not to Die Alone is the bighearted debut novel we all need. For fans of Eleanor Oliphant Is Completely Fine, it\'s a story about love, loneliness, and the importance of taking a chance...',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Category Chips
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: [
                                  _buildCategoryChip('Best Sellers'),
                                  _buildCategoryChip('Fiction'),
                                  _buildCategoryChip('Biography'),
                                ],
                              ),

                              // Extra space before buttons
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),

                      // Buttons at the bottom
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: book.imageColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 14
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Read Now',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              side: BorderSide(color: Colors.grey.shade400),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 14
                              ),
                            ),
                            child: const Text(
                              'Add Review',
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return FilterChip(
      label: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.black87),
      ),
      selected: false,
      onSelected: (_) {},
      backgroundColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}