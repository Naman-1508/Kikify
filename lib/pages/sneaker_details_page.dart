import 'package:flutter/material.dart';
import 'package:kikify/models/sneaker.dart';
import 'package:provider/provider.dart';
import 'package:kikify/providers/cart_provider.dart';
import 'package:kikify/providers/wishlist_provider.dart';

class SneakerDetailsPage extends StatefulWidget{
  final Sneaker sneaker;
  final bool isDarkMode;
  const SneakerDetailsPage({super.key,required this.sneaker,required this.isDarkMode});
  @override
  State<SneakerDetailsPage> createState() => _SneakerDetailsPage();
}
class _SneakerDetailsPage extends State<SneakerDetailsPage>{
  String? selectedSize;
  @override
  Widget build(BuildContext context) {
    final sneaker = widget.sneaker;
    final isDark = widget.isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text(sneaker.name),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: isDark ? Colors.white : Colors.black,
        actions: [
          IconButton(onPressed: (){
            Provider.of<WishlistProvider>(context,listen: false).addToWishlist(widget.sneaker);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to wishlist')),);}, icon: Icon(Icons.favorite_border)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon:Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      backgroundColor: isDark ? Colors.black:Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Hero(tag: sneaker.imageUrl, child: Image.network(sneaker.imageUrl,height: 250,fit: BoxFit.contain,),),
          const SizedBox(height: 10,),
          Text("\$${sneaker.price.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 20,color: Colors.deepOrange),),
          const SizedBox(height: 20,),
          Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
            children: [Text("Select Size",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: isDark ? Colors.white:Colors.black),),
            TextButton(onPressed: (){
              showDialog(context: context, builder:(_) => AlertDialog(
                title: const Text("Size Guide"),
                content: const Text("Sizes are in UK format.\n6 - Small\n7 - Medium\n8 - Large"),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close"),),
                ],
              ),);
            }, child: const Text("Size Guide"),)
            ],),
          const SizedBox(height: 10,),
          Wrap(
            spacing: 10,
              children: sneaker.availableSizes.map((size){
                final isSelected = selectedSize == size;
                return ChoiceChip(label: Text(size), selected: isSelected,
                onSelected: (_) => setState(() => selectedSize = size),);
              }).toList(),
          ),
          const SizedBox(height: 20,),
          Text("Product Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: isDark ? Colors.white:Colors.black),),
          const SizedBox(height: 10,),
          Text(sneaker.description,
          style: TextStyle(color: isDark ? Colors.white70 : Colors.black87),),
          const SizedBox(height: 20,),
          Text("Reviews",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: isDark ? Colors.white : Colors.black,
          ),),
          const SizedBox(height: 10,),
          _buildReviewTile("Rohit","Great quality and perfect fit!"),
          _buildReviewTile("Sneakerhead24", "Looks awesome with streetwear."),
          const SizedBox(height: 30,),
          ElevatedButton(
            onPressed: selectedSize == null ? null
                :(){
              final cart = Provider.of<CartProvider>(context,listen: false);
              cart.addToCart(widget.sneaker , selectedSize!);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to cart!")));},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Buy Now",style: TextStyle(fontSize: 16),),),
        ],
      ),
    );
  }
  Widget _buildReviewTile(String user, String comment) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text(user),
      subtitle: Text(comment),
    );
  }
}
