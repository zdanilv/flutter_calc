import 'package:flutter/material.dart';
import 'package:flutter_calc/data/processor.dart';
import 'package:flutter_calc/presentation/display.dart';
import 'package:flutter_calc/repository/key_controller.dart';
import 'package:flutter_calc/repository/key_pad.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '';

  @override
  void initState() {
    KeyController.listen((event) => Processor.process(event));
    Processor.listen((data) => setState(() {
          _output = data;
        }));
    Processor.refresh();
    super.initState();
  }

  @override
  void dispose() {
    KeyController.dispose();
    Processor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    double buttonSize = screen.width / 4;
    double displayHeight = screen.height - (buttonSize * 5) - (buttonSize);

    return Scaffold(
      backgroundColor: Color.fromARGB(196, 32, 64, 96),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Display(value: _output, height: displayHeight), KeyPad()],
      ),
    );
  }
}
