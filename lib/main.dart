import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'home_page.dart';

Future main() async{
  await dotenv.load(fileName: '.env ' );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Streaming',
      home: HomePage(),
    );
  }
}

final String userID = Random().nextInt(800000 + 900000).toString();
