import 'package:get/get.dart';
import 'package:social_media_app/core/models/post_model.dart';
import 'package:social_media_app/core/services/storage_service.dart';

class DataController extends GetxController {
  final List<Post> posts = [];
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadPosts();
  }

  Future<void> loadPosts() async {
    isLoading.value = true;
    try {
      final cachedPosts = StorageService().box.read('posts') as List<dynamic>?;
      if (cachedPosts != null) {
        posts.clear();
        posts.addAll(cachedPosts.map((p) => Post.fromJson(p)));
      }
    } catch (e) {
      print("Error loading posts: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void addPost(Post post) {
    posts.add(post);
    StorageService().box.write('posts', posts.map((p) => p.toJson()).toList());
  }

  void deletePost(String postId) {
    posts.removeWhere((p) => p.id == postId);
    StorageService().box.write('posts', posts.map((p) => p.toJson()).toList());
  }
}
