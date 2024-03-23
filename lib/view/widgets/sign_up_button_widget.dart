import 'package:flutter/material.dart';
import 'package:lets_meet_app/controller/navigator.dart';
import 'package:lets_meet_app/view/pages/sign_up_page.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Don't have an account?"),
        InkWell(
            onTap: () => navigatePush(const SignUpPage(), context),
            child: const Text(
              ' Sign up',
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
