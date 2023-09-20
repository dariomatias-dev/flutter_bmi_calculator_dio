import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_dio/src/models/body_metrics_model.dart';

import 'package:flutter_bmi_calculator_dio/src/screens/home_screen/form_widget/form_field_widget.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
    required this.calculateBmi,
  });

  final void Function(BodyMetricsModel) calculateBmi;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _heightField = TextEditingController();
  final TextEditingController _weightField = TextEditingController();

  final FocusNode _heightFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();

  void _activateFocusNode(String fieldName) {
    if (_heightField.text.isEmpty || _weightField.text.isEmpty) {
      if (fieldName == 'Altura (cm)') {
        FocusScope.of(context).requestFocus(_weightFocusNode);
      } else {
        FocusScope.of(context).requestFocus(_heightFocusNode);
      }
    } else {
      calculateBmi();
    }
  }

  void calculateBmi() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      final int height = int.parse(_heightField.text);
      final int weight = int.parse(_weightField.text);
      final BodyMetricsModel bodyMetrics = BodyMetricsModel(
        height: height,
        weight: weight,
      );

      setState(() {
        _heightField.text = '';
        _weightField.text = '';
      });

      final calculateBmi = widget.calculateBmi;

      calculateBmi(bodyMetrics);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FormFieldWidget(
              title: 'Altura (cm)',
              valueExemple: '180',
              icon: Icons.straighten,
              controller: _heightField,
              focusNode: _heightFocusNode,
              activateFocusNode: _activateFocusNode,
            ),
            const SizedBox(height: 10.0),
            FormFieldWidget(
              title: 'Peso (kg)',
              valueExemple: '70',
              icon: Icons.balance_rounded,
              controller: _weightField,
              focusNode: _weightFocusNode,
              activateFocusNode: _activateFocusNode,
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => calculateBmi(),
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
