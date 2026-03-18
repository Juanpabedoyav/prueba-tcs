import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';

abstract class PostRepository {
  Future<List<PostsEntity>> getPosts();
}
