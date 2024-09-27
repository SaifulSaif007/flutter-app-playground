import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:placeholder/data/model/comment.dart';
import 'package:placeholder/data/repository/comment_repository.dart';

part 'comment_event.dart';

part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository;

  CommentBloc(this.commentRepository) : super(CommentInitial()) {
    on<LoadComments>((event, emit) async {
      emit(CommentLoading());

      try {
        final comments = await commentRepository.getComments(event.postId);
        emit(CommentLoaded(comments));
      } catch (e) {
        emit(CommentError('Failed to fetch comments'));
      }
    });
  }
}
