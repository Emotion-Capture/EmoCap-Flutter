// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$UserApiService extends UserApiService {
  _$UserApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UserApiService;

  @override
  Future<Response<SignupResponseEntity>> signup(SignupRequest signupRequest) {
    final Uri $url = Uri.parse('/api/users/signup');
    final $body = signupRequest;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SignupResponseEntity, SignupResponseEntity>($request);
  }

  @override
  Future<Response<SigninResponseEntity>> signin(SigninRequest signinRequest) {
    final Uri $url = Uri.parse('/api/users/signin');
    final $body = signinRequest;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SigninResponseEntity, SigninResponseEntity>($request);
  }

  @override
  Future<Response<dynamic>> checkLogin(
    String token,
    MyCommonResponseEntity commonResponseEntity,
  ) {
    final Uri $url = Uri.parse('/api/users/check');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final $body = commonResponseEntity;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
