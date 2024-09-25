part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadComments extends CommentEvent {}
