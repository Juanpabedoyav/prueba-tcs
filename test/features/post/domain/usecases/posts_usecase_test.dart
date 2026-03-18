import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';
import 'package:challengetcs/features/post/domain/repositories/post_repository.dart';
import 'package:challengetcs/features/post/domain/usecases/posts_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPostRepository extends Mock implements PostRepository {
  @override
  Future<List<PostsEntity>> getPosts() {
    return super.noSuchMethod(
          Invocation.method(#getPosts, []),
          returnValue: Future.value(<PostsEntity>[]),
          returnValueForMissingStub: Future.value(<PostsEntity>[]),
        )
        as Future<List<PostsEntity>>;
  }
}

void main() {
  group('PostsUseCase.getPosts', () {
    late MockPostRepository mockPostRepository;
    late PostsUseCase useCase;

    setUp(() {
      mockPostRepository = MockPostRepository();
      useCase = PostsUseCase(mockPostRepository);
    });

    test('delegates to repository and returns posts', () async {
      when(mockPostRepository.getPosts()).thenAnswer(
        (_) async => const [
          PostsEntity(
            id: '1',
            title: 'Use case title',
            body: 'Use case body',
            author: '7',
          ),
        ],
      );

      final result = await useCase.getPosts();

      expect(
        result,
        const [
          PostsEntity(
            id: '1',
            title: 'Use case title',
            body: 'Use case body',
            author: '7',
          ),
        ],
      );
      verify(mockPostRepository.getPosts()).called(1);
    });
  });
}
