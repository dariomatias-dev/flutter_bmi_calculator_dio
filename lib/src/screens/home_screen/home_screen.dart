import 'package:flutter/material.dart';

import 'package:flutter_bmi_calculator_dio/src/widgets/form_widget/form_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        body: const SingleChildScrollView(
          child: Column(
            children: [
              FormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
