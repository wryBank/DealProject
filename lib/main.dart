import 'package:deal/authOTP.dart';
import 'package:deal/nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deal Demo',
      home: authOTP(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(133, 244, 255, 1),
        backgroundColor: Color.fromRGBO(133, 244, 255, 1)
      ),
    );
  }
}

