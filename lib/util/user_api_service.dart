import 'package:chopper/chopper.dart';

import '../models/security/security_api_entity.dart';

part 'user_api_service.chopper.dart';

@ChopperApi()
abstract class UserApiService extends ChopperService {
  static UserApiService create({ChopperClient? client}) =>
      _$UserApiService(client);

  @Post(path: "/api/users/signup")
  Future<Response<SignupResponseEntity>> signup(
      @body SignupRequest signupRequest);

  @Post(path: "/api/users/signin")
  Future<Response<SigninResponseEntity>> signin(
      @body SigninRequest signinRequest);

  @Get(path: "/api/users/check")
  Future<Response> checkLogin(@Header("Authorization") String token,
      @body MyCommonResponseEntity commonResponseEntity);
}
