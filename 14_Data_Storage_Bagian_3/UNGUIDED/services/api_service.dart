import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Post> createPost() async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': 'Flutter Post',
        'body': 'This is a GetX example post.',
        'userId': 1,
      }),
    );
    if (response.statusCode == 201) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<Post> updatePost(int id) async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': 'Updated Title',
        'body': 'This post was updated using GetX',
        'userId': 1,
      }),
    );
    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update post');
    }
  }

  Future<void> deletePost(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/posts/$id'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }
}
