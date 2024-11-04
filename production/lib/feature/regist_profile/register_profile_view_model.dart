import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/models/my_user_model.dart';
import 'package:production/providers/profile_provider.dart';
import 'package:production/repositories/user_data_repository.dart';

class RegisterProfileViewModel {
  late WidgetRef _ref;
  final UserDataRepository _userDataRepository = UserDataRepository();

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  MyUserModel get myProfile => _ref.watch(myProfileProvider);

  void saveUserId(String userId) {
    _ref.read(myProfileProvider.notifier).state =
        _ref.read(myProfileProvider).copyWith(userId: userId);
  }

  void saveName(String name) {
    _ref.read(myProfileProvider.notifier).state =
        _ref.read(myProfileProvider).copyWith(name: name);
  }

  void saveTeamName(String teamName) {
    _ref.read(myProfileProvider.notifier).state =
        _ref.read(myProfileProvider).copyWith(teamName: teamName);
  }

  void saveIcon(int icon) {
    _ref.read(myProfileProvider.notifier).state =
        _ref.read(myProfileProvider).copyWith(icon: icon);
  }

  void saveProfileExperience(String profileExperience) {
    _ref.read(myProfileProvider.notifier).state = _ref
        .read(myProfileProvider)
        .copyWith(profileExperience: profileExperience);
  }

  void saveProfileJob(String profileJob) {
    _ref.read(myProfileProvider.notifier).state =
        _ref.read(myProfileProvider).copyWith(profileJob: profileJob);
  }

  void saveProfileIsStudent(bool profileIsStudent) {
    _ref.read(myProfileProvider.notifier).state = _ref
        .read(myProfileProvider)
        .copyWith(profileIsStudent: profileIsStudent);
  }

  void saveProfileFavpackage(String profileFavPackage) {
    _ref.read(myProfileProvider.notifier).state = _ref
        .read(myProfileProvider)
        .copyWith(profileFavPackage: profileFavPackage);
  }

  void saveProfileHobbies(List<String> profileHobbies) {
    _ref.read(myProfileProvider.notifier).state =
        _ref.read(myProfileProvider).copyWith(profileHobbies: profileHobbies);
  }

  void saveProfilePersonFeat(String profilePersonFeat) {
    _ref.read(myProfileProvider.notifier).state = _ref
        .read(myProfileProvider)
        .copyWith(profilePersonFeat: profilePersonFeat);
  }

  void saveAskExperience(String askExperience) {
    _ref.read(myProfileProvider.notifier).state =
        _ref.read(myProfileProvider).copyWith(askExperience: askExperience);
  }

  void saveAskJob(String askJob) {
    _ref.read(myProfileProvider.notifier).state =
        _ref.read(myProfileProvider).copyWith(askJob: askJob);
  }

  void saveAskIsStudent(bool askIsStudent) {
    _ref.read(myProfileProvider.notifier).state =
        _ref.read(myProfileProvider).copyWith(askIsStudent: askIsStudent);
  }

  Future<void> sendMyData() async {
    await _userDataRepository.sendMyData(myUserData: myProfile);
  }

  MyUserModel getProfile() {
    return _ref.read(myProfileProvider);
  }
}
