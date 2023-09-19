import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
    required this.title,
    required this.valueExemple,
    required this.icon,
    required this.controller,
    required this.focusNode,
    required this.activateFocusNode,
  });

  final String title;
  final String valueExemple;
  final IconData icon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) activateFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        label: Text(title),
        hintText: valueExemple,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        prefixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insirá algum valor';
        }

        return null;
      },
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {
          activateFocusNode(title);
        }
      },
    );
  }
}
