import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/post/post_view.dart';
import 'package:practice/providers.dart';
import 'package:practice/theme/themes.dart';

class TopScreen extends ConsumerWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(topViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Text('お菓子一覧'),
            Spacer(),
            Icon(Icons.settings),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.primaryContainer,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: viewState.when(
        initial: () => const Center(child: Text('No posts yet.')),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return ListTile(
              title: Text(post.snackName),
              subtitle: Text(post.comments),
            );
          },
        ),
        error: (message) => Center(child: Text('Error: $message')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostScreen())
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}