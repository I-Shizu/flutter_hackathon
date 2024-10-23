import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../top/top_model.dart';  // Modelファイルへのパス

class MyViewModel extends StateNotifier<List<TopModelNotifier>> {
  MyViewModel() : super([]);

  // データ追加メソッド
  void addModel(TopModelNotifier model) {
    state = [...state, model];
  }

  // データ削除メソッド
  void removeModel(TopModelNotifier model) {
    state = state.where((m) => m != model).toList();
  }
}

// プロバイダー定義
final myViewModelProvider = StateNotifierProvider<MyViewModel, List<TopModelNotifier>>((ref) {
  return MyViewModel();
});