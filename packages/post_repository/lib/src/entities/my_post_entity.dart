import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

class PostEntity {
  String postId;
  String post;
  DateTime createdAt;
  MyUser myUser;
  String? postImg;

  PostEntity({
    required this.postId,
    required this.post,
    required this.createdAt,
    required this.myUser,
    this.postImg,
  });

  /// To the firebase
  Map<String, Object?> toDocument() {
    return {
      "postId": postId,
      'post': post,
      'createdAt': createdAt,
      'myUser': myUser.toEntity().toDocument(),
      'postImg': postImg,
    };
  }

  /// from the firebase
  static PostEntity formDocument(Map<String, dynamic> doc) {
    return PostEntity(
      postId: doc["postId"] as String,
      post: doc['post'] as String,
      createdAt: (doc['createdAt'] as Timestamp).toDate(),
      myUser: MyUser.fromEntity(MyUserEntity.formDocument(doc['myUser'])),
      postImg: doc['postImg'] as String,
    );
  }

  String toSting() {
    return '''PostEntity{
      postId: $postId
      post: $post
      createdAt: $createdAt 
      myUser: $myUser
      }''';
  }
}
