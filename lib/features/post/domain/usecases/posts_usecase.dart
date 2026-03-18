import 'package:challengetcs/features/post/data/repositories_impl/posts_repository_impl.dart';
import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';
import 'package:challengetcs/features/post/domain/repositories/post_repository.dart';

class PostsUseCase {
  final PostRepository _postRepository;

  PostsUseCase([PostRepository? postRepository])
    : _postRepository = postRepository ?? PostsRepositoryImpl();

  Future<List<PostsEntity>> getPosts() {
    return _postRepository.getPosts();
  }
}
