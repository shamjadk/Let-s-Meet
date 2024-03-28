import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_meet_app/controller/utils/zego_utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatefulWidget {
  final String callID;

  const CallPage({
    super.key,
    required this.callID,
  });

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Stack(
        children: [
          ZegoUIKitPrebuiltCall(
            appID: Zegoutils.appId,
            appSign: Zegoutils.appSign,
            callID: widget.callID,
            userID: user!.uid,
            userName: user.displayName!,
            config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.5,
                    child: Text(
                      'Invitation code: ${widget.callID}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: widget.callID));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invitation ID copied'),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
