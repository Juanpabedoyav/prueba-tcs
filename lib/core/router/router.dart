import 'package:challengetcs/core/router/list_routes.dart';
import 'package:challengetcs/features/post/domain/entities/posts_entity.dart';
import 'package:challengetcs/features/post/presentation/controller/post_controller.dart';
import 'package:challengetcs/features/post/presentation/pages/post_detail/post_detail_page.dart';
import 'package:challengetcs/features/post/presentation/pages/post_list/post_list_page.dart';
import 'package:challengetcs/features/post/presentation/widgets/post_error_listener.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: ListRoutes.postsList.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return PostErrorListener(
            controller: context.read<PostController>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: ListRoutes.postsList.path,
            builder: (context, state) => const PostListPage(),
          ),
          GoRoute(
            path: ListRoutes.postDetail.path,
            redirect: (context, state) {
              if (state.extra is! PostsEntity) {
                return ListRoutes.postsList.path;
              }
              return null;
            },
            builder: (context, state) {
              final post = state.extra as PostsEntity;
              return PostDetailPage(post: post);
            },
          ),
        ],
      ),
    ],
  );
}
