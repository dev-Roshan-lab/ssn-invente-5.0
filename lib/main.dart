import 'package:flutter/material.dart';
import 'package:minivines/screen/home_screen.dart';
import 'package:minivines/screen/pages/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter tik tok',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
