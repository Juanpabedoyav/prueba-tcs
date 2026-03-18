import 'package:challengetcs/config/environment.dart';
import 'package:challengetcs/core/api/api_client.dart';
import 'package:challengetcs/core/exception/custom_exception.dart';
import 'package:dio/dio.dart';

abstract interface class PostsDataSource {
  Future<List<Map<String, dynamic>>> getPosts();
}

class IPostsDataSource with ApiClientMixin implements PostsDataSource {
  @override
  Future<List<Map<String, dynamic>>> getPosts() async {
    try {
      final response = await client.get('${Environment.baseUrl}/posts');

      if (response.statusCode != 200) {
        throw CustomException(
          message:
              'Request failed with status ${response.statusCode}: ${response.statusMessage}',
          response: response.data?.toString(),
          request: response.requestOptions.toString(),
          url: response.requestOptions.uri.toString(),
          httpErrorCode: response.statusCode,
        );
      }

      final data = response.data;

      final posts = data
          .map<Map<String, dynamic>>(
            (post) => Map<String, dynamic>.from(post as Map),
          )
          .toList();
      return posts;
    } on DioException catch (e) {
      throw CustomException(
        message: e.message,
        error: e.error,
        stackTrace: e.stackTrace,
        response: e.response?.data?.toString(),
        request: e.requestOptions.toString(),
        url: e.requestOptions.uri.toString(),
        httpErrorCode: e.response?.statusCode,
      );
    } catch (e, s) {
      throw CustomException(message: e.toString(), stackTrace: s);
    }
  }
}
