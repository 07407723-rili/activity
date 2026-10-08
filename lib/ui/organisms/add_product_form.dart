import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../utils/validators.dart';
import '../atoms/section_heading.dart';
import '../atoms/app_text_form_field.dart';
import '../atoms/category_dropdown_field.dart';
import '../atoms/primary_button.dart';

/// Organism: the full "Add New Product" form. It owns local, form-only
/// state (the text controllers and the selected category) and the
/// validate/submit flow for that state — but it never touches the
/// app's actual product list. On a valid submit it hands a finished
/// Product draft up to whoever owns that list (the Page) via onSubmit,
/// then resets its own fields.
class AddProductForm extends StatefulWidget {
  final ValueChanged<Product> onSubmit;

  const AddProductForm({super.key, required this.onSubmit});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  static const _categories = ['Electronics', 'Home', 'Office', 'Accessories'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedCategory = _categories.first;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final draft = Product(
      id: 0, // placeholder id — the Page assigns the real one
      name: _nameController.text,
      price: double.parse(_priceController.text),
      category: _selectedCategory,
      icon: Icons.inventory_2,
      description: _descriptionController.text,
    );

    widget.onSubmit(draft);

    setState(() {
      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _selectedCategory = _categories.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading('Add New Product'),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextFormField(
                controller: _nameController,
                label: 'Product Name',
                validator: ProductValidators.validateName,
              ),
              const SizedBox(height: 12),
              AppTextFormField(
                controller: _priceController,
                label: 'Price',
                keyboardType: TextInputType.number,
                validator: ProductValidators.validatePrice,
              ),
              const SizedBox(height: 12),
              CategoryDropdownField(
                value: _selectedCategory,
                options: _categories,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value ?? _categories.first;
                  });
                },
              ),
              const SizedBox(height: 12),
              AppTextFormField(
                controller: _descriptionController,
                label: 'Description',
                maxLines: 3,
                alignLabelWithHint: true,
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                label: 'Submit Product',
                onPressed: _handleSubmit,
                expand: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
