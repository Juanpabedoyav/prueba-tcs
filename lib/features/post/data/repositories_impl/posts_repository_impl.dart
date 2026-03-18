import 'package:challengetcs/core/exception/custom_exception.dart';
import 'package:challengetcs/features/post/data/datasources/posts_datasource.dart';
import 'package:challengetcs/features/post/data/models/post_model.dart';
import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';
import 'package:challengetcs/features/post/domain/repositories/post_repository.dart';

class PostsRepositoryImpl implements PostRepository {
  final PostsDataSource _postsDataSource;

  PostsRepositoryImpl([PostsDataSource? postsDataSource])
    : _postsDataSource = postsDataSource ?? IPostsDataSource();

  @override
  Future<List<PostsEntity>> getPosts() async {
    try {
      final response = await _postsDataSource.getPosts();

      final models = response.map(PostsModel.fromJson).toList();
      final entities = models.map(PostsEntity.fromModel).toList();

      return entities;
    } catch (e, s) {
      throw CustomException(
        message: e.toString(),
        stackTrace: s,
        userCode: 'Error al cargar posts 1C',
      );
    }
  }
}
