import 'package:challengetcs/features/post/presentation/controller/post_controller.dart';
import 'package:challengetcs/features/post/presentation/controller/post_ui_event_controller.dart';
import 'package:flutter/material.dart';

class PostErrorListener extends StatefulWidget {
  final PostController controller;
  final Widget child;

  const PostErrorListener({
    required this.controller,
    required this.child,
    super.key,
  });

  @override
  State<PostErrorListener> createState() => _PostErrorListenerState();
}

class _PostErrorListenerState extends State<PostErrorListener> {
  @override
  void initState() {
    super.initState();
    widget.controller.uiEvent.addListener(_onUiEvent);
  }

  @override
  void didUpdateWidget(covariant PostErrorListener oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller == widget.controller) {
      return;
    }

    oldWidget.controller.uiEvent.removeListener(_onUiEvent);
    widget.controller.uiEvent.addListener(_onUiEvent);
  }

  @override
  void dispose() {
    widget.controller.uiEvent.removeListener(_onUiEvent);
    super.dispose();
  }

  Future<void> _onUiEvent() async {
    final event = widget.controller.uiEvent.value;
    if (!mounted || event == null) {
      return;
    }

    if (event is ShowPostErrorDialog) {
      await showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(event.message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }

    widget.controller.clearUiEvent();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
