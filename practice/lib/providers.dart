import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../repository/post_repository.dart';
import '../top/top_view_model.dart';

// FirestoreのインスタンスをPostRepositoryに渡すプロバイダ
final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepository(FirebaseFirestore.instance);
});

// TopViewModelのプロバイダ
final topViewModelProvider = StateNotifierProvider<TopViewModel, TopViewState>((ref) {
  final postRepository = ref.watch(postRepositoryProvider);
  return TopViewModel(postRepository);
});