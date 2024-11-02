import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/constants/lists.dart';
import 'package:production/feature/regist_profile/regist_profile_view_model.dart';
import 'package:production/feature/regist_profile/regist_want_job_view.dart';

class RegistWantExperienceView extends ConsumerWidget {
  const RegistWantExperienceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProfileRegisterViewComponent(
      profileTitle: 'Flutterエンジニアとしての経験',
      btnTextList: experienceList,
      appBarTitle: '繋がりたい人の情報',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex) {
        //ViewModelでriverpodに値を渡す処理を行う。
        ref
            .read(registProfileViewModelProvider.notifier)
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
