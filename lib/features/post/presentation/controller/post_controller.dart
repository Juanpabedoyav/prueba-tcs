import 'package:challengetcs/core/exception/custom_exception.dart';
import 'package:challengetcs/core/global/state.dart';
import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';
import 'package:challengetcs/features/post/domain/usecases/posts_usecase.dart';
import 'package:challengetcs/features/post/presentation/controller/post_ui_event_controller.dart';
import 'package:flutter/foundation.dart';

class PostController extends ChangeNotifier {
  AppState state = AppState.initial;
  List<PostsEntity> posts = [];
  String errorMessage = '';
  final ValueNotifier<PostUiEvent?> uiEvent = ValueNotifier<PostUiEvent?>(null);
  final PostsUseCase postsUseCase;

  PostController([PostsUseCase? postsUseCase])
    : postsUseCase = postsUseCase ?? PostsUseCase();

  Future<void> getPosts() async {
    state = AppState.loading;
    errorMessage = '';
    notifyListeners();

    try {
      posts = await postsUseCase.getPosts();
      state = AppState.success;
    } on CustomException catch (e) {
      state = AppState.error;
      errorMessage = e.userMessage ?? 'Error al cargar posts';
      uiEvent.value = ShowPostErrorDialog(errorMessage);
    } catch (_) {
      state = AppState.error;
      errorMessage = 'Error al cargar posts';
      uiEvent.value = ShowPostErrorDialog(errorMessage);
    } finally {
      notifyListeners();
    }
  }

  void clearUiEvent() {
    uiEvent.value = null;
  }
}
