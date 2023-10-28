part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class GetPost extends PostEvent {}

class CreatePost extends PostEvent {
  final Post post;

  const CreatePost(this.post);
}
