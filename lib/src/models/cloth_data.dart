import 'package:flutter/material.dart';

class ClothData {
  final String title, image, price, rating;
  final bool isFavorite;
  final Color color;

  ClothData({
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    required this.isFavorite,
    required this.color,
  });

  static final clothes = [
    ClothData(
      title: 'Glasses',
      image: 'assets/images/glasses.png',
      price: '\$83.99',
      rating: '4.1',
      isFavorite: false,
      color: const Color(0xFF954535),
    ),
    ClothData(
      title: 'Nike Sneakers',
      image: 'assets/images/sneakers.png',
      price: '\$199.99',
      rating: '4.5',
      isFavorite: true,
      color: const Color(0xFF7B3F00),
    ),
    ClothData(
      title: 'Jeans',
      image: 'assets/images/jeans.png',
      price: '\$159.99',
      rating: '3.9',
      isFavorite: false,
      color: const Color(0xFFD27D2D),
    ),
    ClothData(
      title: 'Baseball Cap',
      image: 'assets/images/pcap.png',
      price: '\$129.99',
      rating: '5.0',
      isFavorite: true,
      color: const Color(0xFF6F4E37),
    ),
    ClothData(
      title: 'Shoe',
      image: 'assets/images/shoe1.png',
      price: '\$149.99',
      rating: '4.0',
      isFavorite: false,
      color: const Color(0xFF7B3F00),
    ),
    ClothData(
      title: 'Sandal',
      image: 'assets/images/shoe5.png',
      price: '\$149.99',
      rating: '2.8',
      isFavorite: false,
      color: const Color(0xFFD27D2D),
    ),
  ];
}
