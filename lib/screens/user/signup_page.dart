import 'package:chopper/chopper.dart';
import 'package:emo_cap_flutter/util/chopper-Client/my_chopper_client.dart';
import 'package:emo_cap_flutter/util/user_api_service.dart';
import 'package:flutter/material.dart';
import '../../models/security/security_api_entity.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _checkPasswordController = TextEditingController();

  @override
  void dispose() {
    _nicknameController.dispose();
    _passwordController.dispose();
    _checkPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입"),
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
            TextFormField(
              controller: _checkPasswordController,
              decoration: InputDecoration(labelText: "CHEKC PASSWORD"),
              obscureText: true, // 문자가 표시되지 않게 처리
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (_passwordController.value.text !=
                    _checkPasswordController.value.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("비밀번호가 일치하지 않습니다.")));
                } else {
                  signup();
                }
              },
              child: Text("회원가입"),
            ),
          ]),
        ),
      ),
    );
  }

  void signup() async {
    final String nickname = _nicknameController.value.text;
    final String password = _passwordController.value.text;
    SignupRequest req = SignupRequest(nickname: nickname, password: password);

    MyChopperClient userChopperClient = MyChopperClient();

    UserApiService userApiService =
        userChopperClient.getChopperService<UserApiService>();

    Future<Response<SignupResponseEntity>> signupResponse =
        userApiService.signup(req);

    signupResponse.then((response) => {
          if (response.isSuccessful || (response.body?.success ?? false))
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('회원가입 성공'),
                    content: Text('로그인하세요.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('확인'),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/home");
                        },
                      ),
                    ],
                  );
                },
              )
            }
          else
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('회원가입 실패'),
                    content:
                        Text((response.body?.message ?? "아이디나 비밀번호를 확인하세요.")),
                    actions: <Widget>[
                      TextButton(
                        child: Text('확인'),
                        onPressed: () {
                          final code = response.statusCode;
                          final error = response.body?.message;
                          print('Status: $code, Error: $error');
                          Navigator.pop(context);
                          //Navigator.of(context).pushNamed("/home");
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
