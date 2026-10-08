import 'package:flutter/material.dart';


class Product {
  final int id;
  final String name;
  final double price;
  final String category;
  final IconData icon;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.icon,
    this.description = '',
  });

  Product copyWith({
    int? id,
    String? name,
    double? price,
    String? category,
    IconData? icon,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      description: description ?? this.description,
    );
  }
}
