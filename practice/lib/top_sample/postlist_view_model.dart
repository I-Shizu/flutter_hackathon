import 'package:practice/models/post_model.dart';
import 'package:practice/repository/firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'postlist_view_model.g.dart';

@riverpod
class PostlistViewModel extends _$PostlistViewModel {
  final PostRepository _repository = PostRepository();

  // 初期化メソッド
  @override
  Future<List<Post>> build() async {
    return await _repository.fetchPosts();
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

    // ローディング状態を表示
    state = const AsyncLoading();

    // 非同期処理を実行し、状態を更新
    state = await AsyncValue.guard(() async {
      // Firestoreに新しい投稿を追加
      await _repository.addPost(post: post);

      // 更新された投稿リストを取得
      final updatedPosts = await _repository.fetchPosts();
      return updatedPosts;
    });
  }
}
