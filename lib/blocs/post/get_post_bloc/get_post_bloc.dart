import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'get_post_event.dart';
part 'get_post_state.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  final PostRepository _postRepository;
  GetPostBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(GetPostInitial()) {
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
