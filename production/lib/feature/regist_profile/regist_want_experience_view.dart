import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/constants/lists.dart';
import 'package:production/feature/regist_profile/regist_want_job_view.dart';
import 'package:production/feature/regist_profile/register_profile_view_model.dart';

class RegistWantExperienceView extends StatelessWidget {
  const RegistWantExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: '(繋がりたい人の)Flutterエンジニアとしての経験',
      btnTextList: experienceList,
      appBarTitle: '繋がりたい人の情報',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex,
          RegisterProfileViewModel registerProfileViewModel) {
        //ViewModelでriverpodに値を渡す処理を行う。
        registerProfileViewModel
            .saveAskExperience(experienceList[selectedIndex]);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const RegistWantJobView(),
          ),
        );
      },
    );
  }
}
