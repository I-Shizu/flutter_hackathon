import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/post/post_view_model.dart';

class PostScreen extends ConsumerWidget {
  final TextEditingController _snackNameController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  int _rating = 5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postViewModel = ref.read(postViewModelNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post a Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _snackNameController,
              decoration: const InputDecoration(labelText: 'Snack Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _commentsController,
              decoration: const InputDecoration(labelText: 'Comments'),
            ),
            const SizedBox(height: 16),
            DropdownButton<int>(
              value: _rating,
              items: List.generate(5, (index) => index + 1)
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text('$value Star'),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  _rating = value;
                }
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final snackName = _snackNameController.text;
                final comments = _commentsController.text;
                if (snackName.isNotEmpty && comments.isNotEmpty) {
                  await postViewModel.addPost(
                      "General", snackName, comments, _rating);
                  _snackNameController.clear();
                  _commentsController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Post submitted successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
