import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:placeholder/navigation/go_router_config.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 100,
            itemBuilder: ((context, index) => const PostItem())));
  }
}

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('userId'), Text('Title'), Text('SubTitle')],
        ),
      ),
    );
  }
}
