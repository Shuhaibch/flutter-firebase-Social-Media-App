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

class CreateImagePost extends PostEvent {
  final Post post;
  final String image;

  const CreateImagePost(this.post, this.image);
}
