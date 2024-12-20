import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class HomeScreen extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX REST API Demo'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: controller.fetchPosts,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('GET'),
                ),
                ElevatedButton(
                  onPressed: controller.createPost,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('POST'),
                ),
                ElevatedButton(
                  onPressed: () => controller.updatePost(1),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('UPDATE'),
                ),
                ElevatedButton(
                  onPressed: () => controller.deletePost(1),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('DELETE'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.posts.isEmpty
                        ? const Center(
                            child: Text('No posts available'),
                          )
                        : ListView.builder(
                            itemCount: controller.posts.length,
                            itemBuilder: (context, index) {
                              final post = controller.posts[index];
                              return Card(
                                margin: const EdgeInsets.only(bottom: 16),
                                child: ListTile(
                                  title: Text(
                                    post.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(post.body),
                                ),
                              );
                            },
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
