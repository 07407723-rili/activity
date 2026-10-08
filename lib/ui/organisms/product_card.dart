import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../atoms/product_icon_badge.dart';
import '../molecules/product_info.dart';
import '../molecules/product_card_actions.dart';

/// Organism: a full product card assembled from atoms and molecules.
/// It receives a single product plus callbacks — it never owns or
/// mutates the catalog list itself, only reports actions (add to cart,
/// delete) upward to whoever does.
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ProductIconBadge(icon: product.icon),
          const SizedBox(width: 12),
          Expanded(
            child: ProductInfo(
              name: product.name,
              category: product.category,
              price: product.price,
            ),
          ),
          ProductCardActions(onAddToCart: onAddToCart, onDelete: onDelete),
        ],
      ),
    );
  }
}
