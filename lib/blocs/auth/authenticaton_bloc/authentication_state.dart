part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User? user;

  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user,
  });

  /// No information of [AuthenticationStatus] of the current User.
  const AuthenticationState.unknown() : this._();

  /// Current User is [Authenticated]
  ///
  /// it takes a [MyUser] properties to represent the [authenticated] user
  const AuthenticationState.autenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  /// Current User is [Unauthenticated]
  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);
  @override
  List<Object?> get props => [status, user];
}
