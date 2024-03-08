import 'package:flutter/material.dart';
import './step_form.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  StepForm(),
    );
  }
}