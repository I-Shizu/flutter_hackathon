import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../repository/post_repository.dart';
import '../model/post_model.dart';

part 'top_view_model.freezed.dart';

@freezed
class TopViewState with _$TopViewState {
  const factory TopViewState.initial() = _Initial;
  const factory TopViewState.loading() = _Loading;
  const factory TopViewState.data(List<Post> posts) = _Data;
  const factory TopViewState.error(String message) = _Error;
}


class TopViewModel extends StateNotifier<TopViewState> {
  final PostRepository _postRepository;

  TopViewModel(this._postRepository) : super(const TopViewState.initial());

  // Firestoreから投稿データを取得するメソッド
  Future<void> fetchPosts() async {
    state = const TopViewState.loading();
    try {
      final posts = await _postRepository.fetchPosts();
      state = TopViewState.data(posts);
    } catch (e) {
      state = TopViewState.error(e.toString());
    }
  }

  // 新しい投稿を追加するメソッド
  Future<void> addPost({
    required String userName,
    required DateTime createdAt,
    required String snackName,
    required String comments,
    required int rating,
  }) async {
    try {
      final newPost = Post(
        userName: userName,
        createdAt: createdAt,
        snackName: snackName,
        comments: comments,
        rating: rating,
      );
      await _postRepository.addPost(newPost);
      fetchPosts(); // 投稿後、リストを再取得
    } catch (e) {
      state = TopViewState.error(e.toString());
    }
  }
}