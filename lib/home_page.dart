import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_streaming/main.dart';

import 'live_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final liveController = TextEditingController(
    text: Random().nextInt(800000 + 900000).toString(),
  );

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ));
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/header.svg',
            width: MediaQuery.of(context).size.width * 5,
          ),
          const SizedBox(height: 20),
          Text('Your UserID : $userID'),
          const Text('Please test with two or more devices'),
          const SizedBox(height: 30),
          TextFormField(
            controller: liveController,
            decoration: const InputDecoration(
                labelText: 'Join or Start a live by Enter ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                )),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              style: buttonStyle,
              onPressed: () => jumpToLivePage(context,
                  liveID: liveController.text, isHost: true),
              child: const Text('Start a Live')),
          const SizedBox(height: 16),
          ElevatedButton(
              style: buttonStyle,
              onPressed: () => jumpToLivePage(context,
                  liveID: liveController.text, isHost: false),
              child: const Text('Join a Live')),
        ],
      ),
    ));
  }

  jumpToLivePage(BuildContext context,
      {required String liveID, required bool isHost}) {
    Navigator.push(context, MaterialPageRoute(builder: (context)
    => LivePage(
      liveID: liveID,
      isHost: isHost,
    )));
  }
}
