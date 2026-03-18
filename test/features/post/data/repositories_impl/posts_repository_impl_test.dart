import 'package:challengetcs/core/exception/custom_exception.dart';
import 'package:challengetcs/features/post/data/datasources/posts_datasource.dart';
import 'package:challengetcs/features/post/data/repositories_impl/posts_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPostsDataSource extends Mock implements PostsDataSource {
  @override
  Future<List<Map<String, dynamic>>> getPosts() {
    return super.noSuchMethod(
          Invocation.method(#getPosts, []),
          returnValue: Future.value(<Map<String, dynamic>>[]),
          returnValueForMissingStub: Future.value(<Map<String, dynamic>>[]),
        )
        as Future<List<Map<String, dynamic>>>;
  }
}

void main() {
  group('PostsRepositoryImpl', () {
    late MockPostsDataSource postsDataSource;
    late PostsRepositoryImpl repository;

    setUp(() {
      postsDataSource = MockPostsDataSource();
      repository = PostsRepositoryImpl(postsDataSource);
    });

    test('getPosts maps datasource response', () async {
      when(postsDataSource.getPosts()).thenAnswer(
        (_) async => [
          {'userId': 1, 'id': 1, 'title': 'title', 'body': 'body'},
        ],
      );

      final result = await repository.getPosts();

      expect(result.length, 1);
      expect(result.first.title, 'title');
      expect(result.first.author, '1');
    });

    test('getPosts throws CustomException when datasource fails', () async {
      when(postsDataSource.getPosts()).thenThrow(Exception('error'));

      expect(repository.getPosts(), throwsA(isA<CustomException>()));
    });
  });
}
