part of 'my_user_bloc.dart';

enum MyUserStatus { success, failure, loading }

class MyUserState extends Equatable {
  final MyUserStatus staus;
  final MyUser? user;

  const MyUserState._({this.staus = MyUserStatus.loading, this.user});

  const MyUserState.loading() : this._();

  const MyUserState.success(MyUser user)
      : this._(staus: MyUserStatus.success, user: user);
  const MyUserState.failure() : this._(staus: MyUserStatus.failure);

  @override
  List<Object?> get props => [staus, user];
}
