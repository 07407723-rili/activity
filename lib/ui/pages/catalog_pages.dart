import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../organisms/search_section.dart';
import '../organisms/product_catalog_list.dart';
import '../organisms/add_product_form.dart';
import '../templates/catalog_screen_template.dart';

/// Page: the only widget allowed to hold the real product list. It owns
/// core data (_products), the search query, and wires real callbacks
/// down into the template's slots. This is where "Add to Cart", delete,
/// search, and new-product confirmation feedback all ultimately live.
class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final List<Product> _products = [
    const Product(id: 1, name: 'Wireless Mouse', price: 599.0, category: 'Electronics', icon: Icons.mouse),
    const Product(id: 2, name: 'Mechanical Keyboard', price: 2499.0, category: 'Electronics', icon: Icons.keyboard),
    const Product(id: 3, name: 'Ceramic Mug', price: 149.0, category: 'Home', icon: Icons.coffee),
    const Product(id: 4, name: 'Notebook', price: 79.0, category: 'Office', icon: Icons.book),
    const Product(id: 5, name: 'Desk Lamp', price: 899.0, category: 'Home', icon: Icons.lightbulb),
    const Product(id: 6, name: 'Backpack', price: 1299.0, category: 'Accessories', icon: Icons.backpack),
    const Product(id: 7, name: 'Water Bottle', price: 299.0, category: 'Accessories', icon: Icons.local_drink),
  ];

  String _searchQuery = '';
  int _nextId = 8;

  void _handleSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  void _handleAddToCart(Product product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${product.name} to cart')),
    );
  }

  void _handleDelete(Product product) {
    setState(() {
      _products.removeWhere((p) => p.id == product.id);
    });
  }

  void _handleNewProduct(Product draft) {
    final newProduct = draft.copyWith(id: _nextId);

    setState(() {
      _products.add(newProduct);
      _nextId += 1;
      _searchQuery = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${newProduct.name} added to catalog!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _products
        .where((p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return CatalogScreenTemplate(
      appBar: AppBar(
        title: const Text(
          'Messy Catalog',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      searchSection: SearchSection(onQueryChanged: _handleSearchChanged),
      catalogSection: ProductCatalogList(
        products: filteredProducts,
        onAddToCart: _handleAddToCart,
        onDelete: _handleDelete,
      ),
      formSection: AddProductForm(onSubmit: _handleNewProduct),
    );
  }
}
