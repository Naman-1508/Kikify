import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kikify/providers/cart_provider.dart';
class CartPage extends StatelessWidget{
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: cartItems.isEmpty
        ? const Center(child: Text('🛒 Your cart is empty'))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context,index){
          final cartItem = cartItems[index];
          return ListTile(
            leading: Image.network(cartItem.sneaker.imageUrl),
            title: Text(cartItem.sneaker.name),
            trailing: IconButton(onPressed: (){
              context.read<CartProvider>().removeFromCart(cartItem);
            }, icon: const Icon(Icons.remove_circle)),
          );
        },
      )
    );
  }
}