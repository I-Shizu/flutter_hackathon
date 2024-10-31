import 'package:production/models/sample_model.dart';
import 'package:production/repositories/firestore_sample_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_view_model.g.dart';

@riverpod
class SampleViewModel extends _$SampleViewModel {
  final FirestoreSampleRepository repository = FirestoreSampleRepository();

  // 初期化時にすべてのデータを取得
  @override
  FutureOr<List<SampleModel>> build() async {
    return await fetchAllSamples();
  }

  // データを追加するメソッド
  Future<void> addSample(SampleModel sample) async {
    await repository.addSample(sample);
    state = AsyncValue.data(await fetchAllSamples());
  }

  // すべてのデータを取得するメソッド
  Future<List<SampleModel>> fetchAllSamples() async {
    return await repository.getAllSamples();
  }

  // データを更新するメソッド
  Future<void> updateSample(String docId, SampleModel updatedSample) async {
    await repository.updateSample(docId, updatedSample);
    state = AsyncValue.data(await fetchAllSamples());
  }

  // データを削除するメソッド
  Future<void> deleteSample(String docId) async {
    await repository.deleteSample(docId);
    state = AsyncValue.data(await fetchAllSamples());
  }
}
