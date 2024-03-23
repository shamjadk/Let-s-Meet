import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lets_meet_app/controller/auth_controller.dart';
import 'package:lets_meet_app/controller/navigator.dart';
import 'package:lets_meet_app/view/pages/call_page.dart';
import 'package:lets_meet_app/view/widgets/join_or_create_button_widget.dart';
import 'package:lets_meet_app/view/widgets/text_field_widget.dart';
import 'package:uuid/uuid.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final channelController = useTextEditingController();
    final uuid = const Uuid().v1();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's Meet"),
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                AuthController.logOut(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JoinOrCreateButtonWidget(
                buttonName: 'Create',
                onPressed: () {
                  navigatePush(
                      CallPage(
                        callID: uuid,
                      ),
                      context);
                },
              ),
              const SizedBox(
                height: 100,
              ),
              JoinOrCreateButtonWidget(
                buttonName: 'Join',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Join Conference',
                        style: TextStyle(fontSize: 20),
                      ),
                      content: TextFieldWidget(
                        controller: channelController,
                        labeltext: 'Enter channel code',
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              navigatePush(
                                  CallPage(
                                    callID: channelController.text,
                                  ),
                                  context);
                            },
                            child: const Text('Join'))
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
