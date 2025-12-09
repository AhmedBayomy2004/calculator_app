import 'package:flutter/material.dart';

class ExpressionInput extends StatelessWidget {
  const ExpressionInput({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      keyboardType: TextInputType.none,
      enableInteractiveSelection: false,
      controller: controller,
      style: TextStyle(fontSize: 40),
      decoration: InputDecoration(border: InputBorder.none),
    );
  }
}
