import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/constants/lists.dart';
import 'package:production/feature/matching_user_list/matching_user_list_view.dart';
import 'package:production/feature/regist_profile/register_profile_view_model.dart';

class RegistWantStudentOrNotView extends StatelessWidget {
  const RegistWantStudentOrNotView({super.key});

  static List<String> btnTextList = ['学生', '社会人'];

  Future<void> _playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/regist_btn.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: '(繋がりたい人が)学生or社会人',
      btnTextList: studentOrWorkingList,
      appBarTitle: '繋がりたい人の情報',
      isProfileSubmitBtn: true,
      onPressed: (
        int selectedIndex,
        RegisterProfileViewModel registerProfileViewModel,
      ) async {
        // 効果音を再生
        await _playSound();

        // ViewModelでriverpodに値を渡す処理を行う
        registerProfileViewModel
            .saveAskIsStudent(studentOrWorkingList[selectedIndex] == '学生');
        await registerProfileViewModel.sendMyData();

        // 遷移処理
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MatchingUserListView(),
          ),
          (Route<dynamic> route) => false,
        );
      },
    );
  }
}