import 'package:post_repository/src/models/models.dart';

abstract class PostRepository {
  Future<Post> creatPost(Post post );
  Future createImagePost(Post post, String file);

  Future<List<Post>> getPost();
  Future<String> uploadPicturePost(String file, String userId);

}
