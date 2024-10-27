import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_model.freezed.dart';
part 'sample_model.g.dart';

@freezed
class SampleModel with _$SampleModel {
  factory SampleModel({
    String? id, // ドキュメントIDを追加
    required String name,
    required String description,
  }) = _SampleModel;

  factory SampleModel.fromJson(Map<String, dynamic> json) =>
      _$SampleModelFromJson(json);
}
