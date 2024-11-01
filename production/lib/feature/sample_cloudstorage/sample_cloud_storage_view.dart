import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'sample_cloud_storage_view_model.dart';
import 'dart:io';

class SampleCloudStorageView extends ConsumerWidget {
  const SampleCloudStorageView({Key? key}) : super(key: key);

  /// 画像をCloud Storageにアップロード
  Future<void> _uploadImage(WidgetRef ref, File imageFile) async {
    // Cloud Storageの保存先パス
    String destination = 'uploads/${imageFile.path.split('/').last}';

    // アップロードを実行
    await ref
        .read(sampleCloudStorageViewModelProvider.notifier)
        .uploadFile(imageFile.path, destination);
  }

  /// 画像を選択してアップロード
  Future<void> _pickAndUploadImage(WidgetRef ref) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // 選択した画像ファイルをFileとして取得
      final imageFile = File(pickedFile.path);

      // アップロードを実行
      await _uploadImage(ref, imageFile);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(sampleCloudStorageViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Storage Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _pickAndUploadImage(ref),
              child: const Text('Pick & Upload Image'),
            ),
            if (viewModel is AsyncData && viewModel.value != null) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Uploaded File URL: ${viewModel.value}'),
              ),
              Image.network(
                viewModel.value!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ],
            if (viewModel is AsyncError) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error: ${viewModel.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
            if (viewModel is AsyncLoading) ...[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
