import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/models/my_user_model.dart';

final myProfileProvider = StateProvider<MyUserModel>(
  (ref) => const MyUserModel(
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
  ),
);
