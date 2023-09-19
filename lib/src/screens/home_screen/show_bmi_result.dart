import 'package:flutter/material.dart';

import 'package:flutter_bmi_calculator_dio/src/models/bmi_data_model.dart';

void showBmiResult(
  BuildContext screenContext,
  BmiDataModel bmiData,
) {
  showDialog(
    context: screenContext,
    builder: (showDialogContext) {
      return AlertDialog(
        title: const Text('Resultado'),
        content: Wrap(
          runSpacing: 20.0,
          children: [
            Row(
              children: [
                const Text('IMC igual a: '),
                Text(
                  bmiData.bmi.toString(),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                bmiData.interpretation,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(showDialogContext);
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
