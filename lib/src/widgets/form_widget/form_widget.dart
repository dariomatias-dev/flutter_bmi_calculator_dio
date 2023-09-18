import 'package:flutter/material.dart';

import 'package:flutter_bmi_calculator_dio/src/widgets/form_widget/form_field_widget.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
    required this.calculateBmi,
  });

  final void Function(double, double) calculateBmi;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _heightField = TextEditingController();
  final TextEditingController _weightField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FormFieldWidget(
              title: 'Altura',
              valueExemple: '180',
              icon: Icons.straighten,
              controller: _heightField,
            ),
            const SizedBox(height: 10.0),
            FormFieldWidget(
              title: 'Peso',
              valueExemple: '70',
              icon: Icons.balance_rounded,
              controller: _weightField,
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();

                  if (_formKey.currentState!.validate()) {
                    final double height = double.parse(_heightField.text);
                    final double weight = double.parse(_weightField.text);

                    final calculateBmi = widget.calculateBmi;

                    calculateBmi(height, weight);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Calcular',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
