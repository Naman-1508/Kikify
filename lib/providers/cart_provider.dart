import 'package:flutter/material.dart';
import 'package:kikify/models/sneaker.dart';
import 'package:kikify/models/cart_items.dart';
class CartProvider with ChangeNotifier{
final List<CartItem> _items = [];
List<CartItem> get items => _items;
void addToCart(Sneaker sneaker,String size) {
  final exists = _items.any((item) => item.sneaker == sneaker && item.size == size);
  if (!exists) {
    _items.add(CartItem(sneaker: sneaker, size: size));
    notifyListeners();
  }
}
void removeFromCart(CartItem item){
  _items.remove(item);
  notifyListeners();
}
  void clearCart(){
    _items.clear();
    notifyListeners();
}
}
