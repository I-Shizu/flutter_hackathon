import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/constants/lists.dart';
import 'package:production/feature/regist_profile/regist_my_job_view.dart';
import 'package:production/feature/regist_profile/regist_profile_view_model.dart';

class RegistMyExperienceView extends ConsumerWidget {
  const RegistMyExperienceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProfileRegisterViewComponent(
      profileTitle: 'Flutterエンジニアとしての経験',
      btnTextList: experienceList,
      appBarTitle: 'プロフィール登録',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex) {
        //ViewModelでriverpodに値を渡す処理を行う。
        ref.read(registProfileViewModelProvider.notifier).saveProfileExperience(
              experienceList[selectedIndex],
            );
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
