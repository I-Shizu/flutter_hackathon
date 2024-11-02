import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/constants/lists.dart';
import 'package:production/feature/regist_profile/register_profile_view_model.dart';

class RegistWantStudentOrNotView extends StatelessWidget {
  const RegistWantStudentOrNotView({super.key});

  static List<String> btnTextList = ['学生', '社会人'];

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: '学生or社会人',
      btnTextList: studentOrWorkingList,
      appBarTitle: '繋がりたい人の情報',
      isProfileSubmitBtn: true,
      onPressed: (int selectedIndex,
          RegisterProfileViewModel registerProfileViewModel) {
        registerProfileViewModel
            .saveAskIsStudent(studentOrWorkingList[selectedIndex] == '学生');
        print('myProfile: ${registerProfileViewModel.myProfile}');
      },
    );
  }
}
