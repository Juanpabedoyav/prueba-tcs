import 'package:challengetcs/core/global/state.dart';
import 'package:challengetcs/core/router/list_routes.dart';
import 'package:challengetcs/features/post/presentation/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostController>().getPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Consumer<PostController>(
        builder: (context, controller, child) {
          final posts = controller.posts;
          if (controller.state == AppState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<PostController>().getPosts();
            },
            child: posts.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.push(ListRoutes.postDetail.path);
                        },
                        child: Column(
                          children: [
                            Text(posts[index].title),
                            Text(posts[index].body),
                          ],
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
