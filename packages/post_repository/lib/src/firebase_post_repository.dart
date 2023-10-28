import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:post_repository/post_repository.dart';
import 'package:post_repository/src/models/post.dart';
import 'package:post_repository/src/post_repo.dart';
import 'package:uuid/uuid.dart';

class FirebasePostRepository implements PostRepository {
  final postColloction = FirebaseFirestore.instance.collection('posts');
  @override
  Future<Post> creatPost(Post post) async {
    try {
      post.postId = const Uuid().v1();
      post.createdAt = DateTime.now();
      await postColloction.doc(post.postId).set(post.toEntity().toDocument());
      return post;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Post>> getPost() async {
    try {
      return await postColloction.get().then((value) => value.docs
          .map((e) => Post.fromEntity(PostEntity.formDocument(e.data()))).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
