import 'package:flutter/material.dart';

void navigate(Widget page, BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ));
}
