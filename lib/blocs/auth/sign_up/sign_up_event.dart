part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpRequired extends SignUpEvent {
  final MyUser myUser;
  final String passWord;

  SignUpRequired({
    required this.myUser,
    required this.passWord,
  });
}
