import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageSampleRepository {
  final FirebaseStorage _storage;

  CloudStorageSampleRepository({FirebaseStorage? storage})
      : _storage = storage ?? FirebaseStorage.instance;

  /// 指定された[localFilePath]のファイルをCloud Storageの[destination]にアップロードする
  Future<String> uploadFile(String localFilePath, String destination) async {
    File file = File(localFilePath);

    try {
      final ref = _storage.ref(destination);
      await ref.putFile(file);
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }

  /// Cloud Storageの[destination]からファイルを[localSavePath]にダウンロードする
  Future<File> downloadFile(String destination, String localSavePath) async {
    try {
      final ref = _storage.ref(destination);
      final file = File(localSavePath);

      await ref.writeToFile(file);
      return file;
    } catch (e) {
      throw Exception('Failed to download file: $e');
    }
  }

  /// Cloud Storageの[destination]にあるファイルを削除する
  Future<void> deleteFile(String destination) async {
    try {
      final ref = _storage.ref(destination);
      await ref.delete();
    } catch (e) {
      throw Exception('Failed to delete file: $e');
    }
  }

  /// Cloud Storageの[destination]にあるファイルのメタデータを取得する（オプション）
  Future<FullMetadata> getFileMetadata(String destination) async {
    try {
      final ref = _storage.ref(destination);
      final metadata = await ref.getMetadata();
      return metadata;
    } catch (e) {
      throw Exception('Failed to get file metadata: $e');
    }
  }
}
