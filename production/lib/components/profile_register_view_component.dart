import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/feature/regist_profile/register_profile_view_model.dart';
import 'package:production/feature/register_profile/register_profile_view.dart';

class ProfileRegisterViewComponent extends HookConsumerWidget {
  const ProfileRegisterViewComponent({
    super.key,
    required this.profileTitle,
    required this.btnTextList,
    required this.appBarTitle,
    required this.isProfileSubmitBtn,
    required this.onPressed,
  });

  final String appBarTitle;
  final String profileTitle;
  final List<String> btnTextList;
  final bool isProfileSubmitBtn;
  final Function(
          int selectedIndex, RegisterProfileViewModel registerProfileViewModel)
      onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int?>(null);
    final RegisterProfileViewModel registerProfileViewModel =
        RegisterProfileViewModel();
    registerProfileViewModel.setRef(ref);

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  // contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  title: Text(btnTextList[index],
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                  onTap: () {
                    selectedIndex.value = index;
                  },
                  selected: selectedIndex.value == index,
                  selectedTileColor: Colors.orange.withOpacity(0.2),
                  tileColor: Colors.grey.withOpacity(0.1),
                );
              },
              itemCount: btnTextList.length,
            ),
            const SizedBox(
              height: 56,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(280, 48)),
                onPressed: () {
                  if (selectedIndex.value != null) {
                    //riverpodにselectedIndexを渡す。最後の処理だった場合、firestoreに登録する機能も実装する。
                    onPressed(selectedIndex.value!, registerProfileViewModel);
                  } else {
                    //FlutterToastを表示する。
                    Fluttertoast.showToast(msg: '回答を選択してください');
                  }
                },
                child: Text(isProfileSubmitBtn ? '登録完了' : '次へ',
                    style: const TextStyle(fontSize: 16)),
                //  const Text('登録完了') : const Text('次へ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
