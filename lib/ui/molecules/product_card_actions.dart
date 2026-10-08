import 'package:flutter/material.dart';
import '../atoms/primary_button.dart';
import '../atoms/delete_icon_button.dart';

/// Molecule: the cluster of action controls on a product card —
/// "Add to Cart" and delete — grouped together because they always
/// appear and behave as one functional unit. No business logic; it
/// just wires two atoms to the callbacks it's given.
class ProductCardActions extends StatelessWidget {
  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  const ProductCardActions({
    super.key,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(label: 'Add to Cart', onPressed: onAddToCart),
        const SizedBox(height: 6),
        DeleteIconButton(onPressed: onDelete),
      ],
    );
  }
}
