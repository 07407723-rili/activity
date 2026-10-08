import 'package:flutter/material.dart';

/// Atom: the small rounded icon badge shown on each product card.
/// Purely presentational — given an icon, renders it.
class ProductIconBadge extends StatelessWidget {
  final IconData icon;

  const ProductIconBadge({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 32, color: Colors.indigo),
    );
  }
}
