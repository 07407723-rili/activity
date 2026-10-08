import 'package:flutter/material.dart';

/// Atom: formats and displays a price value in the app's currency style.
class PriceTag extends StatelessWidget {
  final double price;

  const PriceTag({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      'PHP ${price.toStringAsFixed(2)}',
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
    );
  }
}
