import 'package:calculatorgdg/widgets/custom_button.dart';
import 'package:eval_ex/expression.dart';
import 'package:flutter/material.dart';

class ButtonsLayout extends StatelessWidget {
  const ButtonsLayout({
    super.key,
    required this.controller,
    required this.changeResult,
    required this.clearResult,
  });
  final TextEditingController controller;
  final void Function(String) changeResult;
  final void Function() clearResult;

  void appendNumber(String text) {
    String lastChar =
        controller.text.isNotEmpty ? controller.text.characters.last : '';
    if (lastChar == '%') {
      controller.text += 'x';
    }
    controller.text += text;
  }

  void appendOperator(String text) {
    String lastChar =
        controller.text.isNotEmpty ? controller.text.characters.last : '';
    if (double.tryParse(lastChar) != null ||
        (lastChar == '%' && (text != '%' && text != '.'))) {
      controller.text += text;
    } else if (controller.text.isNotEmpty) {
      controller.text =
          controller.text.substring(0, controller.text.length - 1) + text;
    }
  }

  void flipSign(String text) {
    if (controller.text.isNotEmpty) {
      int idx = controller.text.length - 1;
      while (idx >= 0 &&
          (int.tryParse(controller.text[idx]) != null ||
              controller.text[idx] == '.')) {
        idx--;
      }
      if (idx < 0) {
        controller.text = '-${controller.text}';
      } else if (controller.text[idx] == '-' && idx == 0) {
        controller.text = controller.text.substring(1);
      } else if (controller.text[idx] == '-' &&
          int.tryParse(controller.text[idx - 1]) == null) {
        controller.text =
            '${controller.text.substring(0, idx)}${controller.text.substring(idx + 1)}';
      } else if (controller.text[idx] == '-' &&
          int.tryParse(controller.text[idx - 1]) != null) {
        controller.text =
            '${controller.text.substring(0, idx)}+${controller.text.substring(idx + 1)}';
      } else {
        controller.text =
            '${controller.text.substring(0, idx + 1)}-${controller.text.substring(idx + 1)}';
      }
    }
  }

  void backSpace(String text) {
    if (controller.text.isNotEmpty) {
      controller.text = controller.text.substring(
        0,
        controller.text.length - 1,
      );
    }
  }

  void clearText(String text) {
    controller.text = '';
    clearResult();
  }

  void evaluateResult(String text) {
    if (controller.text.isEmpty) {
      return;
    }
    String expression = controller.text.replaceAll('x', '*');
    expression = expression.replaceAll('%', '/100');
    Expression exp = Expression(expression);
    try {
      var evaluation = exp.eval();
      var rounded = double.parse(evaluation!.toStringAsFixed(6));
      rounded == rounded.toInt()
          ? changeResult(rounded.toInt().toString())
          : changeResult(rounded.toString());
    } catch (e) {
      changeResult('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomButton(
              text: 'C',
              controller: controller,
              onPressed: clearText,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '±',
              controller: controller,
              onPressed: flipSign,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '%',
              controller: controller,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
              onPressed: appendOperator,
            ),
            CustomButton(
              text: '/',
              controller: controller,
              buttonColor: Colors.blueAccent,
              onPressed: appendOperator,
            ),
          ],
        ),
        Row(
          children: [
            CustomButton(
              text: '7',
              controller: controller,
              onPressed: appendNumber,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '8',
              controller: controller,
              onPressed: appendNumber,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '9',
              controller: controller,
              onPressed: appendNumber,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '+',
              controller: controller,
              buttonColor: Colors.blueAccent,
              onPressed: appendOperator,
            ),
          ],
        ),
        Row(
          children: [
            CustomButton(
              text: '4',
              controller: controller,
              onPressed: appendNumber,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '5',
              controller: controller,
              onPressed: appendNumber,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '6',
              controller: controller,
              onPressed: appendNumber,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '-',
              controller: controller,
              buttonColor: Colors.blueAccent,
              onPressed: appendOperator,
            ),
          ],
        ),
        Row(
          children: [
            CustomButton(
              text: '1',
              controller: controller,
              onPressed: appendNumber,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '2',
              controller: controller,
              onPressed: appendNumber,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '3',
              controller: controller,
              onPressed: appendNumber,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: 'x',
              controller: controller,
              buttonColor: Colors.blueAccent,
              onPressed: appendOperator,
            ),
          ],
        ),
        Row(
          children: [
            CustomButton(
              text: '.',
              controller: controller,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
              onPressed: appendOperator,
            ),
            CustomButton(
              text: '0',
              controller: controller,
              onPressed: appendNumber,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '⌫',
              controller: controller,
              onPressed: backSpace,
              buttonColor: Color.fromARGB(255, 46, 46, 46),
            ),
            CustomButton(
              text: '=',
              controller: controller,
              onPressed: evaluateResult,
              buttonColor: Colors.blueAccent,
            ),
          ],
        ),
      ],
    );
  }
}
