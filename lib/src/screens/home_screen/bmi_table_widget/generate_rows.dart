import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/models/bmi_data_model.dart';

List<DataRow> generateRows(
  List<BmiDataModel> bmiDatas,
  void Function(int) removeBmi,
) {
  final List<DataRow> rows = bmiDatas.map((bmiData) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            bmiData.height.toString(),
          ),
        ),
        DataCell(
          Text(
            bmiData.weight.toString(),
          ),
        ),
        DataCell(
          Text(
            bmiData.bmi.toString(),
          ),
        ),
        DataCell(
          Text(
            bmiData.interpretation,
          ),
        ),
        DataCell(
          IconButton(
            onPressed: () => removeBmi(bmiData.id!),
            icon: const Icon(Icons.remove_circle),
          ),
        ),
      ],
    );
  }).toList();

  return rows;
}
