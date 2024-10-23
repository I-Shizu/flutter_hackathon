import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../top/top_view_model.dart'; // ViewModelファイルへのパス
import '../top/top_model.dart'; // Modelファイルへのパス

class TopView extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final models = ref.watch(myViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text('MVVM Sample with Riverpod')),
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) {
          final model = models[index];
          return ListTile(
            title: Text('投稿を一覧で表示する'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                ref.read(myViewModelProvider.notifier).removeModel(model);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // データを追加する
          ref.read(myViewModelProvider.notifier).addModel(
            TopModelNotifier(title: '新しいアイテム', description: '新しい説明'),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}