import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/providers.dart';
import 'package:practice/repository/post_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:practice/model/post_model.dart';

part 'post_view_model.g.dart';

@riverpod
class PostViewModelNotifier extends _$PostViewModelNotifier {
  late final PostRepository _repository;

  @override
  List<Post> build() {
    // PostRepository の初期化
    _repository = ref.read(postRepositoryProvider);
    // 初期状態は空のリスト
    return [];
  }

  Future<void> fetchPosts() async {
    // Firestore から投稿を取得
    final posts = await _repository.fetchPosts();
    // ステートを更新
    state = posts;
  }

  Future<void> addPost(String userName, String snackName, String comments, int rating) async {
    final post = Post(
      userName: userName,
      createdAt: DateTime.now(),
      snackName: snackName,
      comments: comments,
      rating: rating,
    );

    // Firestore に投稿を追加
    await _repository.addPost(post);

    // ステートを更新
    state = [...state, post];
  }
}