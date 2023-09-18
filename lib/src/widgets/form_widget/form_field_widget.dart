import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
    required this.title,
    required this.valueExemple,
    required this.icon,
  });

  final String title;
  final String valueExemple;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
