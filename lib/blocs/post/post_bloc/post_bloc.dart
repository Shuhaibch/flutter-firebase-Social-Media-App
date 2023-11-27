import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;
  PostBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(PostInitial()) {
    //? Create Post
    on<CreatePost>((event, emit) async {
      emit(PostCreateLoading());
      try {
        final Post post = await _postRepository.creatPost(event.post);
        emit(PostCreateSuccess(post));
      } catch (e) {
        log(e.toString());
        emit(PostCreateFailed());
      }
    });

    //? Create Image Post
    on<CreateImagePost>((event, emit) async {
      emit(PostImageCreateLoading());
      try {
        final Post post =
            await _postRepository.createImagePost(event.post, event.image);
        emit(PostImageCreateSuccess(post));
      } catch (e) {
        log(e.toString());
        emit(PostImageCreateFailed());
      }
    });

    //? get post
    on<GetPost>((event, emit) async {
      emit(GetPostLoading());
      try {
        List<Post> post = await _postRepository.getPost();
        emit(GetPostSuccess(post));
      } catch (e) {
        log(e.toString());
        emit(GetPostFailed());
      }
    });
  }
}
