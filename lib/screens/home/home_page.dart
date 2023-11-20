import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "메인창입니다.",
      home: Scaffold(
        appBar: AppBar(title: const Text("메인창 입니다.")),
        body: Container(),
      ),
    );
  }
}
