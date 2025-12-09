import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.controller,
    required this.onPressed,
  });
  final String text;
  final TextEditingController controller;
  final Color buttonColor;
  final void Function(String)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 80,
        width: 80,
        child: ElevatedButton(
          onPressed: () {
            int? number = int.tryParse(text);
            if (number != null) {
              onPressed!(text);
            } else {
              onPressed!(text);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),

          child: Text(
            text,
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
