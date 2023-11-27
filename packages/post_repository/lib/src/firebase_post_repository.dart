import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:post_repository/post_repository.dart';
import 'package:post_repository/src/models/post.dart';
import 'package:post_repository/src/post_repo.dart';
import 'package:uuid/uuid.dart';

class FirebasePostRepository implements PostRepository {
  final postColloction = FirebaseFirestore.instance.collection('posts');
  final userColloction = FirebaseFirestore.instance.collection('user');
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
          .map((e) => Post.fromEntity(PostEntity.formDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> uploadPicturePost(String file, String userId) async {
    try {
      File imageFile = File(file);
      Reference fireBaseStoreRef = FirebaseStorage.instance
          .ref()
          .child('$userId/postImg/${userId}_post');
      await fireBaseStoreRef.putFile(imageFile);
      String url = await fireBaseStoreRef.getDownloadURL();
      await postColloction.doc(userId).update({'picture': url});
      return url;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future createImagePost(Post post, String file) async {
    log(file, name: 'pic name');
    String userId = post.myUser.id;
    try {
      File imageFile = File(file);
      post.postId = const Uuid().v1();
      final id = post.postId;
      Reference fireBaseStoreRef = FirebaseStorage.instance
          .ref()
          .child('$userId/postImg/${userId}_post/$id');
      await fireBaseStoreRef.putFile(imageFile);
      String url = await fireBaseStoreRef.getDownloadURL();
      post.postImg = url;

      await postColloction.doc(id).set(post.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
