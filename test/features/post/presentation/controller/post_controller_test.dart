import 'package:challengetcs/core/global/state.dart';
import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';
import 'package:challengetcs/features/post/domain/usecases/posts_usecase.dart';
import 'package:challengetcs/features/post/presentation/controller/post_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPostsUseCase extends Mock implements PostsUseCase {
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
  group('PostController', () {
    late MockPostsUseCase mockPostsUseCase;
    late PostController controller;

    setUp(() {
      mockPostsUseCase = MockPostsUseCase();
      controller = PostController();
    });

    test('starts with initial state', () {
      expect(controller.state, AppState.initial);
    });

    test('getPosts loads posts and updates state to success', () async {
      when(mockPostsUseCase.getPosts()).thenAnswer(
        (_) async => const [
          PostsEntity(
            id: '1',
            title: 'Controller title',
            body: 'Controller body',
            author: '8',
          ),
        ],
      );

      final states = <AppState>[];
      controller.addListener(() => states.add(controller.state));

      await controller.getPosts();

      expect(controller.posts, const [
        PostsEntity(
          id: '1',
          title: 'Controller title',
          body: 'Controller body',
          author: '8',
        ),
      ]);
      expect(controller.state, AppState.success);
      expect(states, [AppState.loading, AppState.success]);
    });

    test('getPosts sets error state when use case fails', () async {
      when(mockPostsUseCase.getPosts()).thenThrow(Exception('failure'));

      final states = <AppState>[];
      controller.addListener(() => states.add(controller.state));

      await controller.getPosts();

      expect(controller.state, AppState.error);
      expect(controller.posts, isEmpty);
      expect(states, [AppState.loading, AppState.error]);
    });
  });
}
