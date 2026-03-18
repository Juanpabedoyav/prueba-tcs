import 'package:challengetcs/features/post/data/models/post_model.dart';
import 'package:equatable/equatable.dart';

class PostsEntity extends Equatable {
  final String id;
  final String title;
  final String body;
  final String author;

  const PostsEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.author,
  });

  factory PostsEntity.fromModel(PostsModel model) {
    return PostsEntity(
      id: model.id.toString(),
      title: model.title,
      body: model.body,
      author: model.userId.toString(),
    );
  }

  @override
  List<Object> get props => [id, title, body, author];
}
