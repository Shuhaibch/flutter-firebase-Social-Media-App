// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:post_repository/src/entities/my_post_entity.dart';
import 'package:user_repository/user_repository.dart';

class Post {
  String postId;
  String post;
  DateTime createdAt;
  MyUser myUser;
  String? postImg;
  Post({
    required this.postId,
    required this.post,
    required this.createdAt,
    required this.myUser,
    this.postImg,
  });

  //Empty User represent the unauthenticated User
  static final empty = Post(
    postId: '',
    post: '',
    createdAt: DateTime.now(),
    myUser: MyUser.empty,
    postImg: '',
  );

  /// To Modify user parameter
  Post copyWith({
    String? postId,
    String? post,
    DateTime? createdAt,
    MyUser? myUser,
    String? postImg,
  }) {
    return Post(
      postId: postId ?? this.postId,
      post: post ?? this.post,
      createdAt: createdAt ?? this.createdAt,
      myUser: myUser ?? this.myUser,
      postImg: postImg ?? this.postImg,
    );
  }

  /// Convienent getter to determine wheather the user is empty
  bool get isEmpty => this == Post.empty;

  /// Convienent getter to determine wheather the user is not empty
  bool get isNotEmpty => this != Post.empty;

  /// from the local to the firebase
  PostEntity toEntity() {
    return PostEntity(
      postId: postId,
      post: post,
      createdAt: createdAt,
      myUser: myUser,
      postImg: postImg,
    );
  }

  // from the firebase to the local storage
  static Post fromEntity(PostEntity entity) {
    return Post(
      postId: entity.postId,
      createdAt: entity.createdAt,
      post: entity.post,
      myUser: entity.myUser,
      postImg: entity.postImg,
    );
  }

  @override
  String toString() {
    return '''Post{
      postId: $postId
      post: $post
      createdAt: $createdAt 
      myUser: $myUser
      }''';
  }
}
