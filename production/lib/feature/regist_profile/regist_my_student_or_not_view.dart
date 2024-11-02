import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/constants/lists.dart';
import 'package:production/feature/regist_profile/regist_my_hobbies_view.dart';
import 'package:production/feature/regist_profile/regist_want_experience_view.dart';
import 'package:production/feature/regist_profile/register_profile_view_model.dart';

class RegistMyStudentOrNotView extends StatelessWidget {
  const RegistMyStudentOrNotView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: '学生or社会人',
      btnTextList: studentOrWorkingList,
      appBarTitle: 'プロフィール登録',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex,
          RegisterProfileViewModel registerProfileViewModel) {
        //ViewModelでriverpodに値を渡す処理を行う。
        registerProfileViewModel
            .saveProfileIsStudent(studentOrWorkingList[selectedIndex] == '学生');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RegistMyHobbiesView()),
        );
      },
    );
  }
}
