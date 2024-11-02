import 'package:flutter/material.dart';
import 'package:production/components/profile_register_view_component.dart';

class RegistWantStudentOrNotView extends StatelessWidget {
  const RegistWantStudentOrNotView({super.key});

  static List<String> btnTextList = ['学生', '社会人'];

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: '学生or社会人',
      btnTextList: btnTextList,
      appBarTitle: '繋がりたい人の情報',
      isProfileSubmitBtn: true,
      onPressed: (int selectedIndex) {
        //TODO ViewModelでriverpodに値を渡す処理を行う。
      },
    );
  }
}
