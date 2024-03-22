import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback? onPressed;
  const ElevatedButtonWidget(
      {super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.blue)),
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}
