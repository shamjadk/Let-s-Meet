import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_meet_app/controller/utils/zego_utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  final String callID;

  const CallPage({
    super.key,
    required this.callID,
  });

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Stack(
        children: [
          ZegoUIKitPrebuiltCall(
            appID: Zegoutils.appId,
            appSign: Zegoutils.appSign,
            callID: callID,
            userID: user!.uid,
            userName: user.displayName!,
            config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: callID));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invitation ID copied'),
                    ),
                  );
                },
                child: Text('Invitation code: $callID')),
          )
        ],
      ),
    );
  }
}
