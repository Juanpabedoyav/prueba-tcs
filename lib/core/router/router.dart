import 'package:challengetcs/core/router/list_routes.dart';
import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';
import 'package:challengetcs/features/post/presentation/pages/post_detail/post_detail_page.dart';
import 'package:challengetcs/features/post/presentation/pages/post_list/post_list_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: ListRoutes.postsList.path,
    routes: [
      GoRoute(
        path: ListRoutes.postsList.path,
        builder: (context, state) => const PostListPage(),
      ),
      GoRoute(
        path: ListRoutes.postDetail.path,
        builder: (context, state) {
          final post = state.extra as PostsEntity;
          return PostDetailPage(post: post);
        },
      ),
    ],
  );
}
