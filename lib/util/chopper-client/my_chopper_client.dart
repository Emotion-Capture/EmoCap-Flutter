import 'package:chopper/chopper.dart';
import 'package:emo_cap_flutter/util/user_api_service.dart';
import 'package:pretty_chopper_logger/pretty_chopper_logger.dart';

class MyChopperClient {
  late ChopperClient _client;
  MyChopperClient() {
    createChopperClient();
  }

  T getChopperService<T extends ChopperService>() {
    return _client.getService<T>();
  }

  void createChopperClient() {
    _client = ChopperClient(
      baseUrl: Uri.parse("http://--.---.---.--:----"),
      interceptors: [PrettyChopperLogger()],
      services: {
        UserApiService.create(),
      },
      converter: const JsonConverter(),
    );
  }
}
