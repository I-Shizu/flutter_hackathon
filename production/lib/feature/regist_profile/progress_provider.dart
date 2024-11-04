// progress_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentStepProvider = StateProvider<int>((ref) => 1); // 初期値を1
final totalSteps = 8; // 全体のステップ数
