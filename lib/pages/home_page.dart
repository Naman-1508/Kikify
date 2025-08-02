import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kikify/pages/notification_page.dart';
import 'package:kikify/pages/wishlist_page.dart';
import 'package:kikify/widgets/sneaker_card.dart';
import 'package:kikify/widgets/category_chip.dart';
import 'package:kikify/models/sneaker.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'sneaker_details_page.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomePage({Key? key, required this.isDarkMode, required this.onToggleTheme}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;
  final List<String> categories = ['Hype', 'Rare', 'Under Retail', 'Daily Fashion', 'Hot Trends'];
  String selectedCategory = 'Hype';
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = widget.isDarkMode;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'KIKIFY',
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            shadows: [Shadow(color: Colors.black54, blurRadius: 10)],
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NotificationPage(isDarkMode: isDarkMode),
                      ),
                    );
                  },
                  icon: Icon(Icons.notifications)),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  icon: Icon(Icons.shopping_cart_outlined)),
              IconButton(
                icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                onPressed: widget.onToggleTheme,
              ),
            ],
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=3',
            ),
          ),
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
              if (index == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (_) => WishlistPage()));
              }
            },
            backgroundColor: isDarkMode ? Colors.grey[900]!.withOpacity(0.7) : Colors.white.withOpacity(0.7),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: isDarkMode ? Colors.white60 : Colors.black54,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
              BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Text(
                'Welcome back, Sneakerhead 👋',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Find the freshest sneaker drops 🔥',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 20),
              const Text('Find YOUR\nNEXT GRAIL',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search sneakers...',
                      filled: true,
                      fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.mic),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 56,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    return CategoryChip(
                        label: cat,
                        isSelected: selectedCategory == cat,
                        isDarkMode: isDarkMode,
                        onTap: () {
                          setState(() {
                            selectedCategory = cat;
                          });
                        });
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 230,
                child: CarouselSlider.builder(
                  itemCount: dummySneakers.take(8).length,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.75,
                    disableCenter: true,
                    padEnds: false,
                    scrollPhysics: BouncingScrollPhysics(),
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final sneaker = dummySneakers[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => SneakerDetailsPage(
                                      sneaker: sneaker,
                                      isDarkMode: isDarkMode,
                                    ),
                                  ),
                                );
                              },
                              child: SneakerCard(sneaker: sneaker),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Trending',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 260,
                child: PageView.builder(
                  itemCount: dummySneakers.length,
                  controller: PageController(viewportFraction: 0.75),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SneakerDetailsPage(
                                    sneaker: dummySneakers[index], isDarkMode: isDarkMode)),
                          );
                        },
                        child: SneakerCard(sneaker: dummySneakers[index]));
                  },
                ),
              ),
              const Text(
                '🔥 Featured',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 240,
                child: PageView.builder(
                  itemCount: dummySneakers.length,
                  controller: PageController(viewportFraction: 0.75),
                  itemBuilder: (context, index) {
                    return Transform.scale(
                      scale: 1,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SneakerDetailsPage(
                                      sneaker: dummySneakers[index], isDarkMode: isDarkMode)),
                            );
                          },
                          child: SneakerCard(sneaker: dummySneakers[index])),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                '🛎 Daily Drops',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Column(
                children: dummySneakers.map((sneaker) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode
                              ? Colors.black54
                              : Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SneakerDetailsPage(
                                  sneaker: sneaker, isDarkMode: isDarkMode)),
                        );
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            sneaker.imageUrl,
                            width: 50,
                          ),
                        ),
                        title: Text(sneaker.name,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: const Text("Coming soon 🔥"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
