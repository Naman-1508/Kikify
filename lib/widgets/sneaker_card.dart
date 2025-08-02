import 'package:flutter/material.dart';
import 'package:kikify/models/sneaker.dart';
class SneakerCard extends StatelessWidget{
  final Sneaker sneaker;
    const SneakerCard({Key?key, required this.sneaker}): super(key: key);
    @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(aspectRatio: 1,
          child: Image.network(sneaker.imageUrl,fit: BoxFit.contain),
          ),
          Padding(padding: const EdgeInsets.all(8),
            child: Text(
              sneaker.name,
              style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
            ),
          ),
          // Padding(padding: const EdgeInsets.all(8),
          // // child: Text(
          // //   sneaker.price,
          // //   style: const TextStyle(fontWeight: FontWeight.bold),
          // // ),
          // // ),
        ],
      ),
    );
  }
}