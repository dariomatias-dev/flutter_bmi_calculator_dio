import 'package:flutter_bmi_calculator_dio/src/models/body_metrics_model.dart';

class BmiDataModel extends BodyMetricsModel {
  BmiDataModel({
    required double height,
    required double weight,
    required this.bmi,
    required this.interpretation,
  }) : super(
          height: height,
          weight: weight,
        );

  final double bmi;
  final String interpretation;
}
