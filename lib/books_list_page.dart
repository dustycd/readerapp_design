import 'package:flutter/material.dart';
import 'book_details_page.dart';
import 'custom_bottom_navbar.dart';
import 'model/book.dart';

class BooksListPage extends StatefulWidget {
  const BooksListPage({super.key});

  @override
  BooksListPageState createState() => BooksListPageState();
}

class BooksListPageState extends State<BooksListPage> {
  int _currentIndex = 1;
  String selectedCategory = 'Best Sellers';

  // All categories including "All" as "Best Sellers"
  final List<String> categories = [
    'Best Sellers',
    'Fiction',
    'Design',
    'Art',
    'Dystopia',
  ];

  // Sample master book list
  final List<Book> allBooks = [
    Book(
      category: 'Fiction',
      title: 'How Not To Die ...',
      author: 'By Richard Roper',
      rating: '4.63',
      reviewsCount: '375',
      imageColor: Colors.orangeAccent,
    ),
    Book(
      category: 'Dystopia',
      title: 'The Power',
      author: 'By Naomi Alderman',
      rating: '4.20',
      reviewsCount: '286',
      imageColor: Colors.redAccent,
    ),
    Book(
      category: 'Fiction',
      title: 'No Longer Human',
      author: 'By Osamu Dazai',
      rating: '4.55',
      reviewsCount: '520',
      imageColor: Colors.blueAccent,
    ),
    Book(
      category: 'Fiction',
      title: 'Atomic Habits',
      author: 'By James Clear',
      rating: '4.80',
      reviewsCount: '1,200',
      imageColor: Colors.greenAccent,
    ),
    Book(
      category: 'Art',
      title: 'Educated',
      author: 'By Tara Westover',
      rating: '4.70',
      reviewsCount: '890',
      imageColor: Colors.purpleAccent,
    ),
    Book(
      category: 'Design',
      title: 'Sapiens',
      author: 'By Yuval Noah Harari',
      rating: '4.65',
      reviewsCount: '2,100',
      imageColor: Colors.tealAccent,
    ),
  ];

  
  final ScrollController _chipsScrollController = ScrollController();
  bool _showLeftFade = false;
  bool _showRightFade = true; 

  @override
  void initState() {
    super.initState();
    _chipsScrollController.addListener(_onChipsScroll);
  }

  @override
  void dispose() {
    _chipsScrollController.removeListener(_onChipsScroll);
    _chipsScrollController.dispose();
    super.dispose();
  }

  void _onChipsScroll() {
    // Determine if we can scroll left or right
    setState(() {
      _showLeftFade = _chipsScrollController.offset > 0;
      _showRightFade = _chipsScrollController.offset <
          _chipsScrollController.position.maxScrollExtent;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // You can add navigation logic here if you want.
  }

  List<Book> get filteredBooks {
    if (selectedCategory == 'Best Sellers') {
      return allBooks;
    } else {
      return allBooks.where((book) => book.category == selectedCategory).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final orangeColor = Colors.orangeAccent;
    return Scaffold(
      backgroundColor: orangeColor,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Section: "New Reviews" and avatars
              Padding(
                padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'New Reviews',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'More >',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, color: Colors.white70),
                      ),
                      const SizedBox(width: 12),
                      for (int i = 0; i < 4; i++) ...[
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: Text(
                            'A',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                    ],
                  ),
                ),
              ),

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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // "Books For You" + filter icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Books For You',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Icon(Icons.tune, color: Colors.grey.shade600),
                        ],
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        height: 40,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            NotificationListener<OverscrollIndicatorNotification>(
                              onNotification: (overscroll) {
                                overscroll.disallowIndicator();
                                return false;
                              },
                              child: ListView(
                                controller: _chipsScrollController,
                                scrollDirection: Axis.horizontal,
                                children: categories.map((cat) {
                                  return _buildCategoryChip(
                                    cat,
                                    isSelected: cat == selectedCategory,
                                    onTap: () {
                                      setState(() {
                                        selectedCategory = cat;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                            
                            if (_showLeftFade)
                              Positioned(
                                left: 0,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  width: 20,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.white,
                                        Colors.white.withOpacity(0.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (_showRightFade)
                              Positioned(
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  width: 20,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [
                                        Colors.white,
                                        Colors.white.withOpacity(0.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Book List
                      Column(
                        children: filteredBooks.map((book) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to BookDetailsPage on tap
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookDetailsPage(book: book),
                                  ),
                                );
                              },
                              child: _buildBookItem(
                                imageColor: book.imageColor,
                                category: '${book.category}',
                                title: book.title,
                                author: book.author,
                                rating: book.rating,
                                reviewsCount: book.reviewsCount,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 50), // Extra space at bottom
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

  Widget _buildCategoryChip(String label,
      {bool isSelected = false, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontSize: 12,
          ),
        ),
        selected: isSelected,
        onSelected: (_) => onTap(),
        backgroundColor: Colors.grey.shade200,
        selectedColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }

  Widget _buildBookItem({
    required Color imageColor,
    required String category,
    required String title,
    required String author,
    required String rating,
    required String reviewsCount,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: imageColor,
            width: 80,
            height: 120,
            child: const Center(
              child: Icon(Icons.book, color: Colors.white, size: 40),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                author,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                  const Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                  const Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                  const Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                  const Icon(Icons.star_half, size: 18, color: Colors.orangeAccent),
                  const SizedBox(width: 8),
                  Text(
                    '$rating / $reviewsCount',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
