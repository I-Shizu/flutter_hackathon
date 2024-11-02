import 'package:flutter/material.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/feature/regist_profile/regist_want_experience_view.dart';

class RegistMyStudentOrNotView extends StatelessWidget {
  const RegistMyStudentOrNotView({super.key});

  static List<String> btnTextList = ['学生', '社会人'];

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: '学生or社会人',
      btnTextList: btnTextList,
      appBarTitle: 'プロフィール登録',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex) {
        //TODO ViewModelでriverpodに値を渡す処理を行う。
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const RegistWantExperienceView()),
        );
      },
    );
  }
}
