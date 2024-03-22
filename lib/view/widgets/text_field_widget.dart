import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labeltext;
  const TextFieldWidget(
      {super.key, required this.controller, required this.labeltext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: labeltext),
    );
  }
}
