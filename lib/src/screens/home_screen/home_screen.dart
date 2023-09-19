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
  List<BmiDataModel> bmiDatas = [];

  void calculateBmi(BodyMetricsModel bodyMetrics) {
    final heightInMeters = bodyMetrics.height / 100;

    final result = (bodyMetrics.weight / (heightInMeters * heightInMeters));
    final bmi = double.parse(result.toStringAsFixed(2));

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

    setState(() {
      bmiDatas.add(bmiData!);
    });
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
              if (bmiDatas.isNotEmpty) ...[
                const SizedBox(height: 20.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('Altura'),
                      ),
                      DataColumn(
                        label: Text('Peso'),
                      ),
                      DataColumn(
                        label: Text('IMC'),
                      ),
                      DataColumn(
                        label: Text('Situação'),
                      ),
                      DataColumn(
                        label: Text('Remover'),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              bmiDatas[0].height.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              bmiDatas[0].weight.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              bmiDatas[0].bmi.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              bmiDatas[0].interpretation,
                            ),
                          ),
                          DataCell(
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_circle),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    bmiDatas.clear();
                  },
                  child: const Text('Limpar'),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
