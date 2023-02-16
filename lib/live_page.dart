import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'main.dart';

class LivePage extends StatelessWidget {
  final String liveID;
  final bool isHost;
  LivePage({super.key, required this.liveID, required this.isHost});

  final int appID = int.parse(dotenv.get('ZEGO_APP_ID'));
  final String appSign = dotenv.get('ZEGO_APP_SIGN');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: appID,
        appSign: appSign,
        userID: userID,
        userName: 'user_$userID',
        liveID: liveID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience()
          ..audioVideoViewConfig.showAvatarInAudioMode = true
          ..audioVideoViewConfig.showSoundWavesInAudioMode = true,
      ),
    );
  }
}
