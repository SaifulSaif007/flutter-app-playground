part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

final class CommentLoading extends CommentState {}

final class CommentLoaded extends CommentState {
  final List<Comment> comments;

  CommentLoaded(this.comments);

//List<Object> get props => [comments];
}

final class CommentError extends CommentState {
  final String message;

  CommentError(this.message);

  //List<Object> get props => [message];
}
