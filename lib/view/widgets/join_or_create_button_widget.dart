import 'package:flutter/material.dart';

class JoinOrCreateButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const JoinOrCreateButtonWidget(
      {super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
        radius: MediaQuery.sizeOf(context).width / 4,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Icon(Icons.video_call), Text(buttonName)]),
      ),
    );
  }
}
