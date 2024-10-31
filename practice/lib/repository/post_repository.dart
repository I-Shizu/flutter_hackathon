import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice/model/post_model.dart';

class PostRepository {
  final FirebaseFirestore _firestore;

  PostRepository(this._firestore);
  

  Future<void> addPost(Post post) async {
    try {
      await _firestore.collection('posts').add(post.toJson());
    } catch (e) {
      throw Exception('Failed to add post: $e');
    }
  }

  // Firestoreから投稿を取得するメソッド
  Future<List<Post>> fetchPosts() async {
    try {
      final snapshot = await _firestore.collection('posts').get();
      return snapshot.docs.map((doc) {
        return Post.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch posts: $e');
    }
  }
}
