import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice/models/post_model.dart';

class PostRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPost({
    required Post post,
  }) async {
    final Map<String, dynamic> postMap = post.toJson();
    await _firestore.collection('posts').doc().set(postMap);
  }

  Future<List<Post>> fetchPosts() async {
    final snapshot = await _firestore
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList();
  }
}
