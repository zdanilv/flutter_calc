import 'package:flutter/material.dart';
import 'key_controller.dart' as controller;
import 'key_symbol.dart';

abstract class Keys {
  static KeySymbol clear = const KeySymbol('C');
  static KeySymbol sign = const KeySymbol('±');
  static KeySymbol percent = const KeySymbol('%');
  static KeySymbol divide = const KeySymbol('÷');
  static KeySymbol multiply = const KeySymbol('x');
  static KeySymbol subtract = const KeySymbol('-');
  static KeySymbol add = const KeySymbol('+');
  static KeySymbol equals = const KeySymbol('=');
  static KeySymbol decimal = const KeySymbol('.');

  static KeySymbol zero = const KeySymbol('0');
  static KeySymbol one = const KeySymbol('1');
  static KeySymbol two = const KeySymbol('2');
  static KeySymbol three = const KeySymbol('3');
  static KeySymbol four = const KeySymbol('4');
  static KeySymbol five = const KeySymbol('5');
  static KeySymbol six = const KeySymbol('6');
  static KeySymbol seven = const KeySymbol('7');
  static KeySymbol eight = const KeySymbol('8');
  static KeySymbol nine = const KeySymbol('9');
}

class CalculatorKey extends StatelessWidget {
  CalculatorKey({required this.symbol});
  final KeySymbol symbol;

  Color get color {
    switch (symbol.type) {
      case KeyType.FUNCTION:
        return Color.fromARGB(255, 96, 96, 96);
        break;
      case KeyType.OPERATOR:
        return Color.fromARGB(255, 32, 96, 128);
        break;
      default:
        return Color.fromARGB(255, 128, 128, 128);
    }
  }

  static dynamic _fire(CalculatorKey key) =>
      controller.KeyController.fire(controller.KeyEvent(key));

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 4;
    TextStyle style =
        Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white);
    ButtonStyle btn_style = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 4,
        backgroundColor: color);

    return Container(
      width: (symbol == Keys.zero) ? (size * 2) : size,
      padding: EdgeInsets.all(2),
      height: size,
      child: ElevatedButton(
        style: btn_style,
        child: Text(symbol.value, style: style),
        onPressed: () => _fire(this),
      ),
    );
  }
}
