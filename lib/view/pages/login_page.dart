import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lets_meet_app/view/widgets/elevated_button_widget.dart';
import 'package:lets_meet_app/view/widgets/sign_up_button_widget.dart';
import 'package:lets_meet_app/view/widgets/text_field_widget.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Let's meet"),
        // ),
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
              const ElevatedButtonWidget(buttonName: 'Login', onPressed: null),
              const SizedBox(
                height: 16,
              ),
              const SignUpButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
