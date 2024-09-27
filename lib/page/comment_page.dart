import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:placeholder/bloc/comment/comment_bloc.dart';
import 'package:placeholder/data/model/comment.dart';
import 'package:placeholder/data/network/api_service.dart';
import 'package:placeholder/data/network/dio_client.dart';
import 'package:placeholder/data/repository/comment_repository.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String extraString = GoRouterState.of(context).extra as String;

    return RepositoryProvider(
        create: (context) => CommentRepository(ApiService(DioClient().dio)),
        child: BlocProvider(
          create: (context) => CommentBloc(context.read<CommentRepository>())
            ..add(LoadComments(extraString)),
          child: Scaffold(
            appBar: AppBar(title: const Text("Comments")),
            body: BlocBuilder<CommentBloc, CommentState>(
              builder: (context, state) {
                if (state is CommentLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CommentLoaded) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.comments.length,
                      itemBuilder: (context, index) => CommentItem(comment: state.comments[index]));
                } else if (state is CommentError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
          ),
        ));
  }
}

class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.id.toString(),
              style: const TextStyle(fontSize: 14, color: Colors.black)),
          Text(comment.name.toString(),
              style: const TextStyle(fontSize: 14, color: Colors.deepPurple)),
          Text(comment.email.toString(),
              style: const TextStyle(fontSize: 14, color: Colors.black)),
          Text(comment.body.toString(),
              style: const TextStyle(fontSize: 14, color: Colors.black)),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Divider(height: 1, thickness: 2, color: Colors.green),
          )
        ],
      ),
    );
  }
}
