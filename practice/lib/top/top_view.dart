import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice/post/post_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../top/top_view_model.dart'; // ViewModelファイルへのパス

class TopView extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final String snackName = ref.watch(snackNameProvider);
    final String snackComment = ref.watch(snackCommentProvider);

    return Scaffold(
      appBar: AppBar(title: Text('お菓子投稿一覧')),
      body:  Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(snackName),
              subtitle: Text(snackComment),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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