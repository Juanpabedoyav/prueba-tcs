import 'package:challengetcs/config/environment.dart';
import 'package:challengetcs/core/api/api_client.dart';
import 'package:challengetcs/core/exception/custom_exception.dart';
import 'package:challengetcs/features/post/data/datasources/posts_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeApiClient extends ApiClient {
  FakeApiClient({this.response, this.exception});

  final Response<dynamic>? response;
  final DioException? exception;

  @override
  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (exception != null) {
      throw exception!;
    }

    return response! as Response<T>;
  }
}

class TestPostsDataSource extends IPostsDataSource {
  TestPostsDataSource(this.apiClient);

  final ApiClient apiClient;

  @override
  ApiClient get client => apiClient;
}

void main() {
  group('IPostsDataSource', () {
    test('getPosts returns a list of posts', () async {
      final dataSource = TestPostsDataSource(
        FakeApiClient(
          response: Response<List<dynamic>>(
            data: [
              {'userId': 1, 'id': 1, 'title': 'title', 'body': 'body'},
            ],
            statusCode: 200,
            requestOptions: RequestOptions(
              path: '${Environment.baseUrl}/posts',
            ),
          ),
        ),
      );

      final result = await dataSource.getPosts();

      expect(result.length, 1);
      expect(result.first['title'], 'title');
    });

    test('getPosts throws CustomException when request fails', () async {
      final requestOptions = RequestOptions(
        path: '${Environment.baseUrl}/posts',
      );
      final dataSource = TestPostsDataSource(
        FakeApiClient(
          exception: DioException(
            requestOptions: requestOptions,
            message: 'network error',
            response: Response<dynamic>(
              requestOptions: requestOptions,
              statusCode: 500,
            ),
          ),
        ),
      );

      expect(dataSource.getPosts(), throwsA(isA<CustomException>()));
    });
  });
}
