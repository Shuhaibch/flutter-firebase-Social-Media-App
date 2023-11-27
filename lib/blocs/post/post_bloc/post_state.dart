part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostCreateLoading extends PostState {}

final class PostCreateSuccess extends PostState {
  final Post post;

  const PostCreateSuccess(this.post);
}

final class PostCreateFailed extends PostState {}

//* Get Post
final class GetPostSuccess extends PostState {
  final List<Post> post;

  const GetPostSuccess(this.post);
}

final class GetPostFailed extends PostState {}

final class GetPostLoading extends PostState {}

//* Create Post With Image

final class PostImageCreateLoading extends PostState {}

final class PostImageCreateSuccess extends PostState {
  final Post post;

  const PostImageCreateSuccess(this.post);
}

final class PostImageCreateFailed extends PostState {}
