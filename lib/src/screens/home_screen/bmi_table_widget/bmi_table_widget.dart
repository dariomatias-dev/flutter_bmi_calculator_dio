import 'package:flutter/material.dart';

import 'package:bmi_calculator/src/models/bmi_data_model.dart';

import 'package:bmi_calculator/src/screens/home_screen/bmi_table_widget/generate_rows.dart';

class BmiTableWidget extends StatelessWidget {
  const BmiTableWidget({
    super.key,
    required this.bmiDatas,
    required this.removeBmi,
  });

  final List<BmiDataModel> bmiDatas;
  final void Function(int) removeBmi;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
        rows: generateRows(
          bmiDatas,
          removeBmi,
        ),
      ),
    );
  }
}
