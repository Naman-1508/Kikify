import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kikify/providers/wishlist_provider.dart';
import 'package:kikify/models/sneaker.dart';
class WishlistPage extends StatelessWidget{
  const WishlistPage({super.key});
  @override
  Widget build(BuildContext context) {

    final cartItems = context.watch<WishlistProvider>().wishlist;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
        ),
        body: cartItems.isEmpty
            ? const Center(child: Text('🛒 Your wishlist is empty'))
            : ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context,index){
            final sneaker = cartItems[index];
            return ListTile(
              leading: Image.network(sneaker.imageUrl),
              title: Text(sneaker.name),
              trailing: IconButton(onPressed: (){
                context.read<WishlistProvider>().removeFromWishlist(sneaker);
              }, icon: const Icon(Icons.remove_circle)),
            );
          },
        )
    );
  }
}