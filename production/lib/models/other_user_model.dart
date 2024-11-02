import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_user_model.freezed.dart';
part 'other_user_model.g.dart';

@freezed
class OtherUserModel with _$OtherUserModel {
  const factory OtherUserModel({
    required String userId,
    required String name,
    required String teamName,
    required int icon,
    required String profileExperience,
    required String profileJob,
    required bool profileIsStudent,
    required String profileFavPackage,
    required List<String> profileHobbies,
    required String profilePersonFeat,
    required String askExperience,
    required String askJob,
    required bool askIsStudent,
    @JsonKey(includeFromJson: false, includeToJson: false)
    double? totalpoint, // Firestoreには含まれない
  }) = _OtherUserModel;

  factory OtherUserModel.fromJson(Map<String, dynamic> json) =>
      _$OtherUserModelFromJson(json);
}
