import 'package:flutter/material.dart';
import 'custom_bottom_navbar.dart';
import 'model/book.dart';

class BookDetailsPage extends StatefulWidget {
  final Book book;
  const BookDetailsPage({super.key, required this.book});

  @override
  BookDetailsPageState createState() => BookDetailsPageState();
}

class BookDetailsPageState extends State<BookDetailsPage> {
  int _currentIndex = 0;
  final Color topBackgroundColor = const Color(0xFFAEE1E1);

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    
    return Scaffold(
      backgroundColor: topBackgroundColor,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Section: Mimic the style from books_list_page.dart
              Padding(
                padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Book Details',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Back >',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),

              // If you want to add avatars or similar to "New Reviews", replicate that here
              // For now, let's just add some spacing
              const SizedBox(height: 20),

              // White container similar to the one in books_list_page.dart
              Container(
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

                      // Category Chips (Hardcoded for now)
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _buildCategoryChip('Best Sellers'),
                          _buildCategoryChip('Fiction'),
                          _buildCategoryChip('Biography'),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Buttons
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
                                  horizontal: 40, vertical: 14),
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
                                  horizontal: 40, vertical: 14),
                            ),
                            child: const Text(
                              'Add Review',
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return FilterChip(
      label: Text(
        label,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
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