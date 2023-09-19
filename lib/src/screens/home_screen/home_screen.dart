import 'package:flutter/material.dart';

import 'package:flutter_bmi_calculator_dio/src/models/bmi_data_model.dart';
import 'package:flutter_bmi_calculator_dio/src/models/body_metrics_model.dart';

import 'package:flutter_bmi_calculator_dio/src/screens/home_screen/show_bmi_result.dart';

import 'package:flutter_bmi_calculator_dio/src/utils/interpret_bmi_util.dart';

import 'package:flutter_bmi_calculator_dio/src/widgets/form_widget/form_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BmiDataModel? bmiData;

  void calculateBmi(BodyMetricsModel bodyMetrics) {
    final heightInMeters = bodyMetrics.height / 100;

    final bmi = bodyMetrics.weight / (heightInMeters * heightInMeters);

    setBmiData(
      bodyMetrics.height,
      bodyMetrics.weight,
      bmi,
    );
  }

  void setBmiData(
    double height,
    double weight,
    double bmi,
  ) {
    final interpretation = interpretBmiUtil(bmi);

    bmiData = BmiDataModel(
      height: height,
      weight: weight,
      bmi: bmi,
      interpretation: interpretation,
    );

    showBmiResult(
      context,
      bmiData!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de IMC'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FormWidget(
                calculateBmi: calculateBmi,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
