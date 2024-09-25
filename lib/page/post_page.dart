import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:placeholder/bloc/post/post_bloc.dart';
import 'package:placeholder/data/model/post.dart';
import 'package:placeholder/data/network/api_service.dart';
import 'package:placeholder/data/network/dio_client.dart';
import 'package:placeholder/data/repository/post_repository.dart';
import 'package:placeholder/navigation/go_router_config.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => PostRepository(ApiService(DioClient().dio)),
        child: BlocProvider(
            create: (context) =>
                PostBloc(context.read<PostRepository>())..add(LoadPosts()),
            child: Scaffold(
                appBar: AppBar(title: const Text("Posts")),
                body: BlocBuilder<PostBloc, PostState>(
                  builder: (context, state) {
                    if (state is PostLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PostLoaded) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.posts.length,
                          itemBuilder: ((context, index) =>
                              PostItem(post: state.posts[index])));
                    } else if (state is PostError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ))));
  }
}

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(commentPageRoute, extra: post.id.toString());
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8,left: 8, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.id.toString(), style: const TextStyle(fontSize: 14)),
            Text(post.title,
                style: const TextStyle(fontSize: 14, color: Colors.deepPurple)),
            Text(post.body, style: const TextStyle(fontSize: 13)),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Divider(
                height: 1,
                thickness: 2,
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }
}
