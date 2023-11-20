import 'package:emo_cap_flutter/screens/friend/widgets/friend_box.dart';
import 'package:emo_cap_flutter/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget {
  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "친구창 입니다.",
      home: Scaffold(
        appBar: AppBar(title: const Text("친구창 입니다.")),
        body: Column(
          children: [CustomSearchBar(), friendBox()],
        ),
      ),
    );
  }
}
