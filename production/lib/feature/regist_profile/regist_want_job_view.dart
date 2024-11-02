import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/constants/lists.dart';
import 'package:production/feature/regist_profile/regist_profile_view_model.dart';
import 'package:production/feature/regist_profile/regist_want_student_or_not.dart';

class RegistWantJobView extends ConsumerWidget {
  const RegistWantJobView({super.key});

  static List<String> btnTextList = ['エンジニア', 'デザイナー', 'その他'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProfileRegisterViewComponent(
      profileTitle: '職業',
      btnTextList: jobList,
      appBarTitle: '繋がりたい人の情報',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex) {
        //ViewModelでriverpodに値を渡す処理を行う。
        ref
            .read(registProfileViewModelProvider.notifier)
            .saveAskJob(jobList[selectedIndex]);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const RegistWantStudentOrNotView(),
          ),
        );
      },
    );
  }
}
