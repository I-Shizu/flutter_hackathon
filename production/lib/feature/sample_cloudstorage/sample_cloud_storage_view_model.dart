import 'package:production/repositories/cloudstorage_sample_repository.dart';
import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_cloud_storage_view_model.g.dart';

@riverpod
class SampleCloudStorageViewModel extends _$SampleCloudStorageViewModel {
  final CloudStorageSampleRepository _repository;

  SampleCloudStorageViewModel({CloudStorageSampleRepository? repository})
      : _repository = repository ?? CloudStorageSampleRepository();

  /// アップロード済みのファイルのURL
  String? uploadedFileUrl;

  /// 初期化
  @override
  Future<void> build() async {}

  /// ファイルをアップロードしてダウンロードURLを取得
  Future<void> uploadFile(String filePath, String destination) async {
    state = const AsyncLoading();
    try {
      uploadedFileUrl = await _repository.uploadFile(filePath, destination);
      state = AsyncData(uploadedFileUrl);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  /// Cloud Storageからファイルをダウンロード
  Future<File?> downloadFile(String destination, String localSavePath) async {
    try {
      final file = await _repository.downloadFile(destination, localSavePath);
      return file;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }

  /// Cloud Storageからファイルを削除
  Future<void> deleteFile(String destination) async {
    state = const AsyncLoading();
    try {
      await _repository.deleteFile(destination);
      uploadedFileUrl = null; // URLのリセット
      state = const AsyncData(null); // 削除後の状態
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
