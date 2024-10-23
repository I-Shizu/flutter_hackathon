import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_model.freezed.dart';
part 'top_model.g.dart';

@freezed
class TopModelNotifier with _$TopModelNotifier {
  const factory TopModelNotifier({
    required String title,
    required String description,
  }) = _TopModelNotifier;

  factory TopModelNotifier.fromJson(Map<String, dynamic> json) => _$TopModelNotifierFromJson(json);
}