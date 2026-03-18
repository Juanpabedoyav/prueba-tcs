sealed class PostUiEvent {
  const PostUiEvent();
}

class ShowPostErrorDialog extends PostUiEvent {
  final String message;

  const ShowPostErrorDialog(this.message);
}
