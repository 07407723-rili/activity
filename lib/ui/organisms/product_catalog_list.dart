import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../atoms/section_heading.dart';
import 'product_card.dart';

/// Organism: the "Catalog" heading plus the full list of ProductCards.
/// It takes the already-filtered list from the Page — it has no idea
/// search filtering exists, it just lays out whatever list it's given.
class ProductCatalogList extends StatelessWidget {
  final List<Product> products;
  final ValueChanged<Product> onAddToCart;
  final ValueChanged<Product> onDelete;

  const ProductCatalogList({
    super.key,
    required this.products,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading('Catalog'),
        const SizedBox(height: 8),
        Column(
          children: products.map((product) {
            return ProductCard(
              product: product,
              onAddToCart: () => onAddToCart(product),
              onDelete: () => onDelete(product),
            );
          }).toList(),
        ),
      ],
    );
  }
}
