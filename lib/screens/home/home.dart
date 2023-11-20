import 'package:emo_cap_flutter/provider/bottom_navigation_provider.dart';
import 'package:emo_cap_flutter/provider/user_provider.dart';
import 'package:emo_cap_flutter/screens/chat/chat_page.dart';
import 'package:emo_cap_flutter/screens/friend/friend_page.dart';
import 'package:emo_cap_flutter/screens/home/home_page.dart';
import 'package:emo_cap_flutter/screens/user/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late BottomNavigationProvider _bottomNavigationProvider;
  late UserProvider _userProvider;

  Widget? _navigationBody() {
    switch (_bottomNavigationProvider.currentPage) {
      case 0:
        return HomePage();
      case 1:
        return FriendPage();
      case 2:
        return ChatPage();
      case 3:
        if (_userProvider.token != "") {
          logout(context);
        } else {
          return LoginPage();
        }
    }
    return Container();
  }

  void logout(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _userProvider.reset();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('로그아웃 됐습니다.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    });
  }

  Widget _bottomNavigationBarWidget() {
    Icon userIcon = Icon(Icons.person);
    String userLabel = "Login";

    if (_userProvider.token != "") {
      userIcon = Icon(Icons.logout);
      userLabel = "Logout";
    }

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Friend"),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chat"),
        BottomNavigationBarItem(icon: userIcon, label: userLabel),
      ],
      currentIndex: _bottomNavigationProvider.currentPage,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        _bottomNavigationProvider.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
