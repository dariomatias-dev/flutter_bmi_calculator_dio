import 'package:bmi_calculator/src/models/body_metrics_model.dart';

class BmiDataModel extends BodyMetricsModel {
  BmiDataModel({
    required int height,
    required int weight,
    required this.bmi,
    required this.interpretation,
  }) : super(
          height: height,
          weight: weight,
        );

  final double bmi;
  final String interpretation;

  factory BmiDataModel.fromMap(Map<String, dynamic> map) {
    return BmiDataModel(
      height: map['height'],
      weight: map['weight'],
      bmi: map['bmi'],
      interpretation: map['interpretation'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'weight': weight,
      'bmi': bmi,
      'interpretation': interpretation,
    };
  }
}
