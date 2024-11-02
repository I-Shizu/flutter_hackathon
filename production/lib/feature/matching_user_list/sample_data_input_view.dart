import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:production/models/my_user_model.dart';
import 'package:production/repositories/user_data_repository.dart';

class SampleDataInputView extends ConsumerWidget {
  const SampleDataInputView({Key? key}) : super(key: key);

  // プロフィールと質問の選択肢リスト
  static const List<String> experienceList = ['1年未満', '1年以上3年未満', '3年以上'];
  static const List<String> jobList = ['エンジニア', 'デザイナー', 'その他'];
  static const List<String> isStudentList = ['学生', '社会人'];

  Future<void> _sendSampleData(BuildContext context, WidgetRef ref) async {
    final repository = ref.read(userDataRepositoryProvider);

    // サンプルデータを10件作成して送信
    for (int i = 1; i <= 10; i++) {
      final sampleUser = MyUserModel(
        userId: 'user$i',
        name: 'Sample User $i',
        teamName: 'Team ${i % 3}', // 3つのチームに割り当て
        icon: i,
        profileExperience: experienceList[i % experienceList.length],
        profileJob: jobList[i % jobList.length],
        profileIsStudent: i % 2 == 0,
        profileFavPackage: 'Package ${i % 5}', // 5種類のパッケージ
        profileHobbies: ['Hobby ${i % 3}', 'Hobby ${(i + 1) % 3}'],
        profilePersonFeat: 'Feature $i',
        askExperience: experienceList[i % experienceList.length],
        askJob: jobList[i % jobList.length],
        askIsStudent: i % 2 == 1,
      );

      // Firestoreにサンプルユーザーデータを送信
      await repository.sendMyData(myUserData: sampleUser);
    }

    // データ送信完了後に通知
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('サンプルデータが送信されました')),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('サンプルデータ送信'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _sendSampleData(context, ref),
          child: Text('サンプルデータを送信'),
        ),
      ),
    );
  }
}
