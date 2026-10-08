import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchInputField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        labelText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
    );
  }
}