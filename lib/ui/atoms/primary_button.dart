import 'package:flutter/material.dart';

/// Atom: the app's single indigo/white ElevatedButton style, reused for
/// both "Add to Cart" and "Submit Product". It has no logic beyond
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  final bool expand;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.expand = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        padding: expand ? const EdgeInsets.symmetric(vertical: 14) : null,
      ),
      child: Text(
        label,
        style: expand
            ? const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
            : null,
      ),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
