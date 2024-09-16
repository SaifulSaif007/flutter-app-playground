import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:placeholder/navigation/go_router_config.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Post Page"),
        TextButton(
            onPressed: () => context.pushNamed(commentPageRoute, extra: 'abc'),
            child: const Text("Click Here"))
      ],
    );
  }
}
