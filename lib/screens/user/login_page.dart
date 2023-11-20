import 'package:chopper/chopper.dart';
import 'package:emo_cap_flutter/models/security/security_api_entity.dart';
import 'package:emo_cap_flutter/util/chopper-client/my_chopper_client.dart';
import 'package:emo_cap_flutter/util/user_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nicknameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormField(
              controller: _nicknameController,
              decoration: InputDecoration(labelText: "NICKNAME"),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "PASSWORD"),
              obscureText: true, // 문자가 표시되지 않게 처리
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/signup");
              },
              child: Text("회원가입"),
            ),
            ElevatedButton(
              onPressed: () {
                signin();
              },
              child: Text("로그인"),
            ),
          ]),
        ),
      ),
    );
  }

  void signin() async {
    final String nickname = _nicknameController.value.text;
    final String password = _passwordController.value.text;
    SigninRequest req = SigninRequest(nickname: nickname, password: password);

    MyChopperClient userChopperClient = MyChopperClient();

    UserApiService userApiService =
        userChopperClient.getChopperService<UserApiService>();

    Future<Response<SigninResponseEntity>> signinResponse =
        userApiService.signin(req);

    signinResponse.then((response) => {
          if (response.isSuccessful || (response.body?.success ?? false))
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('로그인 성공'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('확인'),
                        onPressed: () {
                          Provider.of<UserProvider>(context).token =
                              (response.body?.token ?? "");
                          Navigator.of(context).pushNamed("/home");
                        },
                      ),
                    ],
                  );
                },
              ),
            }
          else
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                        "로그인 실패 ${'\n'}status: ${response.body?.status ?? 403}"),
                    content: Text(response.body?.message ?? "서버 연결에 실패함."),
                    actions: <Widget>[
                      TextButton(
                        child: Text('확인'),
                        onPressed: () {
                          final code = response.statusCode;
                          final error = response.body?.message;
                          print('Status: $code, Error: $error');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              ),
            }
        });
  }
}
