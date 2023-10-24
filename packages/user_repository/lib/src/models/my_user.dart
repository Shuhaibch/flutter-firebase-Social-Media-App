import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/my_user_entity.dart';

/// model for userdata 
class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? picture;

  const MyUser({
    required this.id,
    required this.name,
    required this.email,
    this.picture,
  });

  //Empty User represent the unauthenticated User
  static const empty = MyUser(
    id: '',
    name: '',
    email: '',
    picture: '',
  );

  /// To Modify user parameter
  MyUser copyWith({
    String? id,
    String? name,
    String? email,
    String? picture,
  }) {
    return MyUser(
      id: id ?? this.id,
      name: email ?? this.email,
      email: email ?? this.email,
      picture: picture ?? this.picture,
    );
  }

  /// Convienent getter to determine wheather the user is empty
  bool get isEmpty => this == MyUser.empty;

  /// Convienent getter to determine wheather the user is not empty
  bool get isNotEmpty => this != MyUser.empty;

  /// from the local to the firebase
  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
      picture: picture,
    );
  }

  // from the firebase to the local storage
  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      picture: entity.picture,
    );
  }

  @override
  List<Object?> get props => [id, email, name, picture];
}
