import 'package:equatable/equatable.dart';
///backend calls 
class MyUserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? picture;

  const MyUserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.picture,
  });

  /// To the firebase
  Map<String, Object?> toDocument() {
    return {
      "id": id,
      'email': email,
      'name': name,
      'picture': picture,
    };
  }

  /// from the firebase
  static MyUserEntity formDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc["id"] as String,
      email: doc['email'] as String,
      name: doc['name'] as String,
      picture: doc['picture'] as String,
    );
  }

  @override
  List<Object?> get props => [id, email, name, picture];

  @override
  String toString() {
    return '''UserEntity{
      id: $id
      email: $email
      name: $name 
      picture: $picture
      }''';
  }
}
