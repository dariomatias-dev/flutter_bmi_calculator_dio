import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/models/bmi_data_model.dart';

List<DataRow> generateRows(
  List<BmiDataModel> bmiDatas,
  void Function(int index) removeBmi,
) {
  final List<DataRow> rows = [];

  for (int index = 0; index < bmiDatas.length; index++) {
    final data = bmiDatas[index];

    final row = DataRow(
      cells: [
        DataCell(
          Text(
            data.height.toString(),
          ),
        ),
        DataCell(
          Text(
            data.weight.toString(),
          ),
        ),
        DataCell(
          Text(
            data.bmi.toString(),
          ),
        ),
        DataCell(
          Text(
            data.interpretation,
          ),
        ),
        DataCell(
          IconButton(
            onPressed: () => removeBmi(index),
            icon: const Icon(Icons.remove_circle),
          ),
        ),
      ],
    );

    rows.add(row);
  }

  return rows;
}
