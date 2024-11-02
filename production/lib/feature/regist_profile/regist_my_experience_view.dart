import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/constants/lists.dart';
import 'package:production/feature/regist_profile/regist_my_job_view.dart';
import 'package:production/feature/regist_profile/register_profile_view_model.dart';

class RegistMyExperienceView extends StatelessWidget {
  const RegistMyExperienceView({super.key});

  Future<void> _playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/next_btn.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: 'Flutterエンジニアとしての経験',
      btnTextList: experienceList,
      appBarTitle: 'プロフィール登録',
      isProfileSubmitBtn: false,
      onPressed: (
        int selectedIndex,
        RegisterProfileViewModel registerProfileViewModel,
      ) {
        _playSound();
        // ViewModelでriverpodに値を渡す処理を行う。
        registerProfileViewModel
            .saveProfileExperience(experienceList[selectedIndex]);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const RegistMyJobView(),
          ),
        );
      },
    );
  }
}