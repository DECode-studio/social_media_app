import 'package:get/get.dart';
import 'package:social_media_app/core/models/post_model.dart';
import 'package:social_media_app/core/services/storage_service.dart';

class ServiceController extends GetxController {
  final StorageService storage = StorageService();

  Future<List<Post>> getPosts() async {
    final cached = storage.box.read('posts') as List<dynamic>?;
    if (cached != null) {
      return cached.map((p) => Post.fromJson(p)).toList();
    }
    return [];
  }

  void savePost(Post post) {
    final posts = storage.box.read('posts') as List<dynamic>?;
    final updated =
        (posts ?? []).isEmpty ? [post.toJson()] : [...posts!, post.toJson()];
    storage.box.write('posts', updated);
  }

  void deletePost(String id) {
    final posts = storage.box.read('posts') as List<dynamic>?;
    if (posts != null) {
      final filtered = posts.where((p) => p['id'] != id).toList();
      storage.box.write('posts', filtered);
    }
  }
}
