import 'package:flutter/material.dart';
import 'package:production/components/profile_register_view_component.dart';
import 'package:production/feature/regist_profile/regist_want_job_view.dart';

class RegistWantExperienceView extends StatelessWidget {
  const RegistWantExperienceView({super.key});

  static List<String> btnTextList = ['1年未満', '1年以上3年未満', '3年以上'];

  @override
  Widget build(BuildContext context) {
    return ProfileRegisterViewComponent(
      profileTitle: 'Flutterエンジニアとしての経験',
      btnTextList: btnTextList,
      appBarTitle: '繋がりたい人の情報',
      isProfileSubmitBtn: false,
      onPressed: (int selectedIndex) {
        //TODO ViewModelでriverpodに値を渡す処理を行う。
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const RegistWantJobView(),
          ),
        );
      },
    );
  }
}
