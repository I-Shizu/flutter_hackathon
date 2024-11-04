import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_user_model.freezed.dart';
part 'my_user_model.g.dart';

@freezed
class MyUserModel with _$MyUserModel {
  const factory MyUserModel({
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
  }) = _MyUserModel;

  factory MyUserModel.fromJson(Map<String, dynamic> json) =>
      _$MyUserModelFromJson(json);
}
