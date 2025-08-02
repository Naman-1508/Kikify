import 'package:flutter/material.dart';
import 'package:kikify/models/sneaker.dart';
class WishlistProvider with ChangeNotifier{
  final List<Sneaker> _items = [];
  List<Sneaker> get wishlist => _items;
  void addToWishlist(Sneaker sneaker){
    if(!_items.contains(sneaker)){
      _items.add(sneaker);
      notifyListeners();
    }
  }
  void removeFromWishlist(Sneaker sneaker){
    _items.remove(sneaker);
    notifyListeners();
  }
  void clearWishlist(){
    _items.clear();
    notifyListeners();
  }
}