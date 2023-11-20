import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "채팅창 입니다.",
      home: Scaffold(
        appBar: AppBar(title: const Text("채팅창 입니다.")),
        body: const Center(
          child: Text("채팅창이라고"),
        ),
      ),
    );
  }
}
