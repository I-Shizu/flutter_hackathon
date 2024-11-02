import 'package:flutter/material.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/feature/regist_profile/regist_my_student_or_not_view.dart';
import 'package:production/feature/regist_profile/regist_want_student_or_not.dart';

class RegistMyJobView extends StatelessWidget {
  const RegistMyJobView({super.key});

  static List<String> btnTextList = ['エンジニア', 'デザイナー', 'その他'];

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: '職業',
      btnTextList: btnTextList,
      appBarTitle: 'プロフィール登録',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex) {
        //TODO ViewModelでriverpodに値を渡す処理を行う。
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const RegistMyStudentOrNotView(),
          ),
        );
      },
    );
  }
}
