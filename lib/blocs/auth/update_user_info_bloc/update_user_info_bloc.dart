import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'update_user_info_event.dart';
part 'update_user_info_state.dart';

class UpdateUserInfoBloc
    extends Bloc<UpdateUserInfoEvent, UpdateUserInfoState> {
  final UserRepository _userRepository;
  UpdateUserInfoBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UpdateUserInfoInitial()) {
    on<UploadPicture>((event, emit) async {
      emit(UploadPictureLoading());
      try {
        String userImage =
            await _userRepository.upLoadPicture(event.file, event.userId);
        emit(UploadPictureSuccuss(userImage));
      } catch (e) {
        log(e.toString());
        emit(UploadPictureFailed());
      }
    });
  }
}
