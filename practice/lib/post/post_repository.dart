import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPost(
    required Post post,
  ) async {
    final Map<String, dynamic> postMap = post.tojson();
    await _firestore.collection('posts').doc().set(postMap);
  }
}
