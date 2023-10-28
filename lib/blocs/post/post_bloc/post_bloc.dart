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
