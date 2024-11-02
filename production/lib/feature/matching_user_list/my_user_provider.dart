import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:production/models/my_user_model.dart';

// プロフィールと質問の選択肢リスト
const List<String> experienceList = ['1年未満', '1年以上3年未満', '3年以上'];
const List<String> jobList = ['エンジニア', 'デザイナー', 'その他'];
const List<String> isStudentList = ['学生', '社会人'];

// MyUserModelのインスタンスを提供するプロバイダー
final myUserProvider = Provider<MyUserModel>((ref) {
  // 現在のユーザー情報を持つMyUserModelのインスタンスを返す
  // この例では仮のデータを設定しています
  return MyUserModel(
    userId: 'user123',
    name: 'MyUser',
    teamName: 'TeamA',
    icon: 1,
    profileExperience: experienceList[1], // 例として2番目の選択肢を設定
    profileJob: jobList[0], // 例として「エンジニア」を設定
    profileIsStudent: isStudentList[1] == '社会人', // 社会人を選択
    profileFavPackage: 'riverpod',
    profileHobbies: ['coding', 'reading'],
    profilePersonFeat: 'feature',
    askExperience: experienceList[0], // 例として1番目の選択肢を設定
    askJob: jobList[2], // 例として「その他」を設定
    askIsStudent: isStudentList[0] == '学生', // 学生を選択
  );
});
