import 'package:flutter/material.dart';
import '../atoms/section_heading.dart';
import '../atoms/search_input_field.dart';

/// Organism: the full search section — heading + input — composed
/// directly from atoms since there's no meaningful sub-grouping between
/// two dissimilar atoms. Stateless: the query itself is core screen
/// state owned by the Page and reported upward via callback.
class SearchSection extends StatelessWidget {
  final ValueChanged<String> onQueryChanged;

  const SearchSection({super.key, required this.onQueryChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading('Search Products'),
        const SizedBox(height: 8),
        SearchInputField(onChanged: onQueryChanged),
      ],
    );
  }
}
