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
  MyUserModel build() => const MyUserModel(
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

  void saveUserId(String userId) {
    state = state.copyWith(userId: userId);
  }

  void saveName(String name) {
    state = state.copyWith(name: name);
  }

  void saveTeamName(String teamName) {
    state = state.copyWith(teamName: teamName);
  }

  void saveIcon(int icon) {
    state = state.copyWith(icon: icon);
  }

  void saveProfileExperience(String profileExperience) {
    state = state.copyWith(profileExperience: profileExperience);
  }

  void saveProfileJob(String profileJob) {
    state = state.copyWith(profileJob: profileJob);
  }

  void saveProfileIsStudent(bool profileIsStudent) {
    state = state.copyWith(profileIsStudent: profileIsStudent);
  }

  void saveProfileFavpackage(String profileFavPackage) {
    state = state.copyWith(profileFavPackage: profileFavPackage);
  }

  void saveProfileHobbies(List<String> profileHobbies) {
    state = state.copyWith(profileHobbies: profileHobbies);
  }

  void saveProfilePersonFeat(String profilePersonFeat) {
    state = state.copyWith(profilePersonFeat: profilePersonFeat);
  }

  void saveAskExperience(String askExperience) {
    state = state.copyWith(askExperience: askExperience);
  }

  void saveAskJob(String askJob) {
    state = state.copyWith(askJob: askJob);
  }

  void saveAskIsStudent(bool askIsStudent) {
    state = state.copyWith(askIsStudent: askIsStudent);
  }
}
