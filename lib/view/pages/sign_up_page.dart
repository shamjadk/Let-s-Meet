import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lets_meet_app/controller/auth_controller.dart';
import 'package:lets_meet_app/controller/navigator.dart';
import 'package:lets_meet_app/view/pages/login_page.dart';
import 'package:lets_meet_app/view/widgets/elevated_button_widget.dart';
import 'package:lets_meet_app/view/widgets/text_field_widget.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
                controller: emailController, labeltext: 'Enter your email'),
            TextFieldWidget(
                controller: passwordController,
                labeltext: 'Enter your password'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButtonWidget(
              buttonName: 'Sign up',
              onPressed: () {
                AuthController.signUpWithEmail(
                    emailController.text, passwordController.text);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Already have an account?"),
                InkWell(
                    onTap: () => navigatePush(const LoginPage(), context),
                    child: const Text(
                      ' Login now',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
