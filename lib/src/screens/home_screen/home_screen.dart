import 'package:flutter/material.dart';

import 'package:bmi_calculator/src/models/bmi_data_model.dart';
import 'package:bmi_calculator/src/models/body_metrics_model.dart';

import 'package:bmi_calculator/src/repositories/bmi_data_repository.dart';

import 'package:bmi_calculator/src/screens/home_screen/bmi_table_widget/bmi_table_widget.dart';
import 'package:bmi_calculator/src/screens/home_screen/form_widget/form_widget.dart';
import 'package:bmi_calculator/src/screens/home_screen/show_bmi_result.dart';

import 'package:bmi_calculator/src/utils/interpret_bmi_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BmiDataRepository bmiDataRepository = BmiDataRepository();
  BmiDataModel? bmiData;

  void calculateBmi(BodyMetricsModel bodyMetrics) {
    final heightInMeters = bodyMetrics.height / 100;

    final result = (bodyMetrics.weight / (heightInMeters * heightInMeters));
    final bmi = double.parse(result.toStringAsFixed(2));

    addBmiData(
      bodyMetrics.height,
      bodyMetrics.weight,
      bmi,
    );
  }

  void addBmiData(
    int height,
    int weight,
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

    bmiDataRepository.addData(bmiData!);
  }

  void removeBmi(int id) {
    bmiDataRepository.removeData(id);
  }

  @override
  void initState() {
    bmiDataRepository.getData();
    super.initState();
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
        body: ValueListenableBuilder(
          valueListenable: bmiDataRepository.bmiDatasValueNotifier,
          builder: (context, List<BmiDataModel> bmiDatas, child) {
            return Column(
              children: [
                FormWidget(
                  calculateBmi: calculateBmi,
                ),
                if (bmiDatas.isNotEmpty) ...[
                  const SizedBox(height: 20.0),
                  BmiTableWidget(
                    bmiDatas: bmiDatas,
                    removeBmi: removeBmi,
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      bmiDataRepository.deleteAllData();
                    },
                    child: const Text('Limpar'),
                  ),
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}
