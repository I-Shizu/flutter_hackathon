import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required String userName,
    required DateTime createdAt,
    required String snackName,
    required String comments,
    @JsonKey(name: '5star-rating') required int rating,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
