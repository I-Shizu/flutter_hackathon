import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/constants/lists.dart';
import 'package:production/feature/regist_profile/regist_profile_view_model.dart';

class RegistWantStudentOrNotView extends ConsumerWidget {
  const RegistWantStudentOrNotView({super.key});

  static List<String> btnTextList = ['学生', '社会人'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProfileRegisterViewComponent(
      profileTitle: '学生or社会人',
      btnTextList: studentOrWorkingList,
      appBarTitle: '繋がりたい人の情報',
      isProfileSubmitBtn: true,
      onPressed: (int selectedIndex) {
        ref
            .read(registProfileViewModelProvider.notifier)
            .saveAskIsStudent(studentOrWorkingList[selectedIndex] == '学生');
        //TODO ViewModelでriverpodに値を渡す処理を行う。
        print('${ref.watch(registProfileViewModelProvider)}');
      },
    );
  }
}
