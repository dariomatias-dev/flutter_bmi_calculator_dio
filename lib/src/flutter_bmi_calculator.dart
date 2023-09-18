import 'package:flutter/material.dart';

import 'package:flutter_bmi_calculator_dio/src/core/routes/flutter_bmi_calculator_routes.dart';

class FlutterBmiCalculatorApp extends StatelessWidget {
  const FlutterBmiCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de IMC Flutter - Dio',
      routes: flutterBmiCalculatorRoutes,
    );
  }
}
