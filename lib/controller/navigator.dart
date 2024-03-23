import 'package:flutter/material.dart';

void navigatePush(Widget page, BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ));
}

void navigatePushAndRemove(Widget page, BuildContext context) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ));
}
