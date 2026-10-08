import 'package:flutter/material.dart';

class CategoryDropdownField extends StatelessWidget {
  final String value;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final String label;

  const CategoryDropdownField({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
    this.label = 'Category',
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(labelText: label),
      items: options
          .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
