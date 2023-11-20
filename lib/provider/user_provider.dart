import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  // _ = private 선언
  String _token = "";
  // getter 생성
  String get token => _token;

  set token(String token) => _token = token;

  reset() {
    _token = "";
    notifyListeners();
  }
}
