import 'package:flutter/material.dart';

/// Atom: the bold section title style reused for "Search Products",
/// "Catalog", and "Add New Product". Holds no state and no logic
/// beyond rendering the text it's given.
class SectionHeading extends StatelessWidget {
  final String text;

  const SectionHeading(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
