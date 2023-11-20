import 'dart:io';
import 'package:emo_cap_flutter/provider/bottom_navigation_provider.dart';
import 'package:emo_cap_flutter/provider/user_provider.dart';
import 'package:emo_cap_flutter/screens/chat/chat_page.dart';
import 'package:emo_cap_flutter/screens/friend/friend_page.dart';
import 'package:emo_cap_flutter/screens/home/home.dart';
import 'package:emo_cap_flutter/screens/home/home_page.dart';
import 'package:emo_cap_flutter/screens/user/login_page.dart';
import 'package:emo_cap_flutter/screens/user/signup_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) => BottomNavigationProvider(),
      ),
      ChangeNotifierProvider(
        create: (BuildContext context) => UserProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emotion-Capture',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ko', 'KO'),
      ],
      theme: ThemeData(
          fontFamily: 'Noto_Serif_KR',
          brightness: Brightness.light,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
              foregroundColor: Colors.black, backgroundColor: Colors.white)),
      routes: {
        "/home": (context) => Home(),
        "/homepage": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/chat": (context) => ChatPage(),
        "/friend": (context) => FriendPage(),
      },
      home: Home(),
    );
  }
}
