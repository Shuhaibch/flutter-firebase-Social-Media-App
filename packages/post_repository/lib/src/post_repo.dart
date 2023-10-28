import 'package:post_repository/src/models/models.dart';

abstract class PostRepository {
  Future<Post> creatPost(Post post);
  Future<List<Post>> getPost();
}
