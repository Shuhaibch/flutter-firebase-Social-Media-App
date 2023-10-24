part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationUserChanges extends AuthenticationEvent {
  final User? user;

  const AuthenticationUserChanges(this.user);
}

