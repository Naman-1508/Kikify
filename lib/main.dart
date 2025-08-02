import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'package:kikify/pages/shopping_cart.dart';
import 'package:kikify/pages/wishlist_page.dart';
import 'package:kikify/models/sneaker.dart';
import 'package:kikify/providers/cart_provider.dart';
import 'package:kikify/providers/wishlist_provider.dart';

void main(){
  runApp(const KikifyApp());
}
class KikifyApp extends StatefulWidget {
  const KikifyApp({Key? key}) : super(key: key);

  @override
  State<KikifyApp> createState() => _KikifyAppState();
}
class _KikifyAppState extends State<KikifyApp>{
  bool isDarkMode = false;
  void toggleTheme(){
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: MaterialApp(
        title: 'Kikify',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Montserrat',
            scaffoldBackgroundColor: Color(0xFFF3F4F6), // slightly warmer tone
          textTheme: const TextTheme(
            headlineMedium: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
            bodyLarge: TextStyle(color: Colors.black),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            headlineMedium: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
            bodyLarge: TextStyle(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        initialRoute: '/',
        routes: {
          '/' : (context) => HomePage(isDarkMode: isDarkMode, onToggleTheme: toggleTheme),
          '/cart' : (context) => const CartPage(),
          '/wishlist' : (context) => const WishlistPage(),
        },
      ),
    );
  }
}