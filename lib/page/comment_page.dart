import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final String extraString = GoRouterState.of(context).extra! as String;

    return const Column(
      children: [
        Text("Comment Page")
      ],
    );
  }
}

