import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_counter_view_model.g.dart';

@riverpod
class SampleCounterViewModel extends _$SampleCounterViewModel {
  @override
  int build() {
    return 0;
  }

  void incrementCounter() {
    state++;
  }
}
