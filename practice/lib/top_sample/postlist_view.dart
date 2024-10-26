import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/models/post_model.dart';
import 'package:practice/post/post_view.dart';
import 'postlist_view_model.dart';

class PostListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ViewModelの状態を監視
    final postlistAsyncValue = ref.watch(postlistViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('お菓子の投稿一覧'),
      ),
      // 非同期状態を処理し、リスト表示
      body: postlistAsyncValue.when(
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // お菓子の名前と評価を行に表示
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            post.snackName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800],
                            ),
                          ),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < post.rating
                                    ? Colors.amber
                                    : Colors.grey[300],
                                size: 16,
                              );
                            }),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // ユーザー名
                      Text(
                        'User: ${post.userName}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8),
                      // コメント
                      Text(
                        post.comments,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 8),
                      // 日付
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Date: ${post.createdAt.toLocal()}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('エラーが発生しました: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // PostScreenへの画面遷移
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
