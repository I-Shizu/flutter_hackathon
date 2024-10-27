import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:production/models/sample_model.dart';
import 'sample_view_model.dart';

class SampleListView extends ConsumerWidget {
  const SampleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sampleListAsync = ref.watch(sampleViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample List'),
      ),
      body: sampleListAsync.when(
        data: (sampleList) => ListView.builder(
          itemCount: sampleList.length,
          itemBuilder: (context, index) {
            final sample = sampleList[index];
            return ListTile(
              title: Text(sample.name),
              subtitle: Text(sample.description),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => ref
                    .read(sampleViewModelProvider.notifier)
                    .deleteSample(sample.id!), // idを使用
              ),
              onTap: () {
                // 更新画面などへのナビゲーションが可能
                // ref.read(sampleViewModelProvider.notifier).updateSample(...);
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final sample =
              SampleModel(name: 'New Sample', description: 'New description');
          await ref.read(sampleViewModelProvider.notifier).addSample(sample);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
