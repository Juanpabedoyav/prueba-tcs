enum ListRoutes { home, postsList, postDetail }

extension ListRoutesExtension on ListRoutes {
  String get path {
    switch (this) {
      case ListRoutes.home:
        return '/';
      case ListRoutes.postsList:
        return '/posts';
      case ListRoutes.postDetail:
        return '/post';
    }
  }
}
