import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:placeholder/data/model/post.dart';
import 'package:placeholder/data/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {
    on<LoadPosts>((event, emit) async {
      emit(PostLoading());

      try {
        final posts = await postRepository.getPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError('Failed to fetch posts'));
      }
    });
  }
}
