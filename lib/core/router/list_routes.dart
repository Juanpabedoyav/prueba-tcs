enum ListRoutes { postsList, postDetail }

extension ListRoutesExtension on ListRoutes {
  String get path {
    switch (this) {
      case ListRoutes.postsList:
        return '/posts';
      case ListRoutes.postDetail:
        return '/post';
    }
  }
}
