import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';
import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  final PostsEntity post;

  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text(post.body)],
        ),
      ),
    );
  }
}
