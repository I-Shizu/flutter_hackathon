import 'package:flutter/material.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/feature/regist_profile/regist_my_job_view.dart';

class RegistMyExperienceView extends StatelessWidget {
  const RegistMyExperienceView({super.key});

  static List<String> btnTextList = ['1年未満', '1年以上3年未満', '3年以上'];

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: 'Flutterエンジニアとしての経験',
      btnTextList: btnTextList,
      appBarTitle: 'プロフィール登録',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex) {
        //TODO ViewModelでriverpodに値を渡す処理を行う。
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
