import 'package:challengetcs/config/environment.dart';
import 'package:dio/io.dart';

class ApiClient extends DioForNative {
  ApiClient([super.options]);
}

mixin ApiClientMixin {
  ApiClient get client => ApiClient();
  Environment get environment => Environment();
}
