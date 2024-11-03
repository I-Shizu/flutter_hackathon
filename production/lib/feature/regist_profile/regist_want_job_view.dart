import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/constants/lists.dart';
import 'package:production/feature/regist_profile/regist_want_student_or_not.dart';
import 'package:production/feature/regist_profile/register_profile_view_model.dart';

class RegistWantJobView extends StatelessWidget {
  const RegistWantJobView({super.key});

  Future<void> _playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/next_btn.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: '(繋がりたい人の)職業',
      btnTextList: jobList,
      appBarTitle: '繋がりたい人の情報',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex,
          RegisterProfileViewModel registerProfileViewModel) async {
        // 効果音を再生
        await _playSound();

        // ViewModelでriverpodに値を渡す処理を行う
        registerProfileViewModel.saveAskJob(jobList[selectedIndex]);

        // 次の画面に遷移
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const RegistWantStudentOrNotView(),
          ),
        );
      },
    );
  }
}