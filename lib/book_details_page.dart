import 'package:flutter/material.dart';
import 'model/book.dart';

class BookDetailsPage extends StatefulWidget {
  final Book book;
  const BookDetailsPage({super.key, required this.book});

  @override
  BookDetailsPageState createState() => BookDetailsPageState();
}

class BookDetailsPageState extends State<BookDetailsPage> {
  final Color topBackgroundColor = const Color(0xFFAEE1E1); // Light teal/blue background
  final Color chipBackgroundColor = const Color(0xFFF6F1E9); // A light cream for chips
  final Color buttonColor = const Color(0xFF7AD3D7); // A nice aqua for the 'Read Now' button

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          Container(
            height: screenHeight,
            width: screenWidth,
            color: topBackgroundColor,
          ),

          // Top bar (SafeArea to avoid notch)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                      // Bookmark action if needed
                    },
                  ),
                ],
              ),
            ),
          ),

          // White container, positioned lower to leave room for overlapping image
          Positioned(
            top: 280, // Adjust this value to move container up or down
            left: 0,
            right: 0,
            bottom: 0,
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
                padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 120),
                // Push content down to leave space for overlapping image
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Scrollable content
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              book.title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 5),

                            // Author
                            Text(
                              'By ${book.author}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Rating & Reviews
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                                const Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                                const Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                                const Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                                const Icon(Icons.star_half, size: 18, color: Colors.orangeAccent),
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
                                const Icon(Icons.search, size: 18, color: Colors.grey),
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
                              'Smart, darkly funny, and life-affirming, How Not to Die Alone is the bighearted debut novel we all need, for fans of Eleanor Oliphant Is Completely Fine, it\'s a story about love, loneliness, and the importance of taking a chance...',
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

                            const SizedBox(height: 30),

                            // Buttons at the bottom
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
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
                                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
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
                  ],
                ),
              ),
            ),
          ),

          
          Positioned(
            top: 130, 
            left: (screenWidth - 180) / 2, 
            child: Container(
              width: 180,
              height: 250, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage('assets/your_image.png'), // replace with your image
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
        ],
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
      backgroundColor: chipBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}