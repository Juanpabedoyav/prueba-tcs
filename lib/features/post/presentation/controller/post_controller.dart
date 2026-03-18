import 'package:challengetcs/core/global/state.dart';
import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';
import 'package:challengetcs/features/post/domain/usecases/posts_usecase.dart';
import 'package:flutter/foundation.dart';

class PostController extends ChangeNotifier {
  AppState state = AppState.initial;
  List<PostsEntity> posts = [];
  final PostsUseCase postsUseCase;

  PostController() : postsUseCase = PostsUseCase();

  Future<void> getPosts() async {
    state = AppState.loading;
    notifyListeners();

    try {
      posts = await postsUseCase.getPosts();
      state = AppState.success;
    } catch (_) {
      state = AppState.error;
    } finally {
      notifyListeners();
    }
  }

  void savePost() {}
}
