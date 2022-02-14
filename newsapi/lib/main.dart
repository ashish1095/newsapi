import 'package:flutter/material.dart';
import 'package:newsapi1/LocalJsonReader.dart';
import 'package:newsapi1/Views/MyHomePage.dart';
import 'package:newsapi1/Views/newsresponse.dart';

import 'package:newsapi1/videodemo.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      home: Newspage(),
    );
  }
}
