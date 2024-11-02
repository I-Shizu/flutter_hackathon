import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/constants/lists.dart';
import 'package:production/feature/regist_profile/regist_want_student_or_not.dart';
import 'package:production/feature/regist_profile/register_profile_view_model.dart';

class RegistWantJobView extends StatelessWidget {
  const RegistWantJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: '職業',
      btnTextList: jobList,
      appBarTitle: '繋がりたい人の情報',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex,
          RegisterProfileViewModel registerProfileViewModel) {
        //ViewModelでriverpodに値を渡す処理を行う。
        registerProfileViewModel.saveAskJob(jobList[selectedIndex]);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const RegistWantStudentOrNotView(),
          ),
        );
      },
    );
  }
}
