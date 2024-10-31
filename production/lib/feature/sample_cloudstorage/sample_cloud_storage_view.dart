import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'sample_cloud_storage_view_model.dart';
import 'dart:io';

class SampleCloudStorageView extends ConsumerWidget {
  const SampleCloudStorageView({super.key});

  /// アセット画像を一時ファイルとして保存し、そのファイルパスを返す
  Future<String> _getLocalFilePathFromAsset(String assetPath) async {
    // アセットファイルをバイトデータとして読み込み
    final byteData = await rootBundle.load(assetPath);

    // 一時ディレクトリを取得
    final tempDir = await getTemporaryDirectory();
    final tempFilePath = '${tempDir.path}/temp_image.png';

    // 一時ファイルとして保存
    final file = File(tempFilePath);
    await file.writeAsBytes(byteData.buffer.asUint8List());

    return tempFilePath;
  }

  /// アセット画像をCloud Storageにアップロード
  Future<void> _uploadAssetImage(WidgetRef ref) async {
    // アセット画像パス
    String assetPath = 'assets/images/flutter_logo.png';

    // アセットを一時ファイルに保存し、そのパスを取得
    String localFilePath = await _getLocalFilePathFromAsset(assetPath);

    // Cloud Storageの保存先パス
    String destination = 'uploads/flutter_logo.png';

    // アップロードを実行
    await ref
        .read(sampleCloudStorageViewModelProvider.notifier)
        .uploadFile(localFilePath, destination);
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
              onPressed: () => _uploadAssetImage(ref),
              child: const Text('Upload Flutter Logo'),
            ),
            if (viewModel is AsyncData && viewModel.value != null) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Uploaded File URL: ${viewModel.value}'),
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
