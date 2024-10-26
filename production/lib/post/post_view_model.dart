import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'post_repository.dart';
import 'post_model.dart';

part 'post_view_model.g.dart';

@riverpod
class PostViewModelNotifier extends _$PostViewModelNotifier {
  final PostRepository _repository = PostRepository();

  @override
  List<Post> build() {
    // 初期値を設定（今回は空のリスト）
    return [];
  }

  Future<void> addPost(
      String userName, String snackName, String comments, int rating) async {
    final post = Post(
      userName: userName,
      createdAt: DateTime.now(),
      snackName: snackName,
      comments: comments,
      rating: rating,
    );

    // Repositoryを使用してFirestoreに投稿を追加
    await _repository.addPost(post: post);

    // ステートを更新
    state = [...state, post];
  }
}
