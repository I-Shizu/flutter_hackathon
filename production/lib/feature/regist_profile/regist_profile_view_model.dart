import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:production/models/my_user_model.dart';
import 'package:production/models/sample_model.dart';
import 'package:production/repositories/firestore_sample_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'regist_profile_view_model.g.dart';

@riverpod
class RegistProfileViewModel extends _$RegistProfileViewModel {
  final FirestoreSampleRepository repository = FirestoreSampleRepository();

  // 初期化時は全てが空のデータを返す
  @override
  MyUserModel? build() {
    return const MyUserModel(
      userId: '',
      name: '',
      teamName: '',
      icon: 0,
      profileExperience: '',
      profileJob: '',
      profileIsStudent: false,
      profileFavPackage: '',
      profileHobbies: [],
      profilePersonFeat: '',
      askExperience: '',
      askJob: '',
      askIsStudent: false,
    );
  }
}
