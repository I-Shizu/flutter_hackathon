import 'package:flutter/material.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/feature/regist_profile/regist_want_student_or_not.dart';

class RegistWantJobView extends StatelessWidget {
  const RegistWantJobView({super.key});

  static List<String> btnTextList = ['エンジニア', 'デザイナー', 'その他'];

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: '職業',
      btnTextList: btnTextList,
      appBarTitle: '繋がりたい人の情報',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex) {
        //TODO ViewModelでriverpodに値を渡す処理を行う。
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const RegistWantStudentOrNotView(),
          ),
        );
      },
    );
  }
}
