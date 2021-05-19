import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  MainTextFormField(
      {required this.label, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.black, fontSize: 20),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              gapPadding: 5,
            ),
            labelText: label.toString(),
            hintText: hint,
            labelStyle: TextStyle(color: Colors.black, fontSize: 18),
            hintStyle: TextStyle(color: Colors.black, fontSize: 14)),
      ),
    );
  }
}
