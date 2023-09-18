import 'package:flutter/material.dart';

import 'package:flutter_bmi_calculator_dio/src/widgets/form_widget/form_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? imc;

  void calculateBmi(double height, double weight) {
    final heightInMeters = height / 100;

    final value = weight / (heightInMeters * heightInMeters);

    setState(() {
      imc = value;
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
              if (imc != null) Text(imc.toString())
            ],
          ),
        ),
      ),
    );
  }
}
