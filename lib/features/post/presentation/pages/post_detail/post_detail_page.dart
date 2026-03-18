import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';
import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  final PostsEntity post;

  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: Center(child: Text(post.body)),
    );
  }
}
