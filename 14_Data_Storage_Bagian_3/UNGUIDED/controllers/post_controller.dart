import 'package:get/get.dart';
import '../models/post_model.dart';
import '../service/api_service.dart';

class PostController extends GetxController {
  final ApiService _apiService = ApiService();
  final RxList<Post> posts = <Post>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      final List<Post> fetchedPosts = await _apiService.fetchPosts();
      posts.value = fetchedPosts;
      Get.snackbar(
        'Success',
        'Posts loaded successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load posts: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createPost() async {
    try {
      isLoading.value = true;
      final Post newPost = await _apiService.createPost();
      posts.add(newPost);
      Get.snackbar(
        'Success',
        'Post created successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to create post: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updatePost(int id) async {
    try {
      isLoading.value = true;
      final Post updatedPost = await _apiService.updatePost(id);
      final index = posts.indexWhere((post) => post.id == id);
      if (index != -1) {
        posts[index] = updatedPost;
      }
      Get.snackbar(
        'Success',
        'Post updated successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update post: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deletePost(int id) async {
    try {
      isLoading.value = true;
      await _apiService.deletePost(id);
      posts.removeWhere((post) => post.id == id);
      Get.snackbar(
        'Success',
        'Post deleted successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to delete post: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
