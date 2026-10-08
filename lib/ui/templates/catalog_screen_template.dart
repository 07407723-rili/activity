import 'package:flutter/material.dart';

/// Template: pure layout. Accepts each section as a pre-built widget
/// slot and arranges them in the screen's scroll layout. It never
/// imports Product or any data model — it has no idea what's inside
/// the slots it's given, only where they go.
class CatalogScreenTemplate extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget searchSection;
  final Widget catalogSection;
  final Widget formSection;

  const CatalogScreenTemplate({
    super.key,
    required this.appBar,
    required this.searchSection,
    required this.catalogSection,
    required this.formSection,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchSection,
            const SizedBox(height: 16),
            catalogSection,
            const Divider(height: 32, thickness: 1),
            formSection,
          ],
        ),
      ),
    );
  }
}
