import 'package:challengetcs/config/environment.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ApiClient extends DioForNative {
  ApiClient([BaseOptions? options])
    : super(
        options ??
            BaseOptions(
              responseType: ResponseType.json,
              headers: const {
                Headers.acceptHeader: Headers.jsonContentType,
                Headers.contentTypeHeader: Headers.jsonContentType,
              },
            ),
      );
}

mixin ApiClientMixin {
  ApiClient get client => ApiClient();
  Environment get environment => Environment();
}
