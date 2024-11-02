import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfileRefisterViewComponent extends HookConsumerWidget {
  const ProfileRefisterViewComponent({
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
  final Function(int selected) onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: Column(
          children: [
            Text(
              profileTitle,
              style: const TextStyle(fontSize: 24),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(btnTextList[index]),
                  onTap: () {
                    selectedIndex.value = index;
                  },
                  selected: selectedIndex.value == index,
                  selectedColor: Colors.orange,
                );
              },
              itemCount: btnTextList.length,
            ),
            const SizedBox(
              height: 56,
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedIndex.value != null) {
                  //riverpodにselectedIndexを渡す。最後の処理だった場合、firestoreに登録する機能も実装する。
                  onPressed(selectedIndex.value!);
                } else {
                  //FlutterToastを表示する。
                  Fluttertoast.showMsg();
                }
              },
              child: isProfileSubmitBtn ? const Text('次へ') : const Text('登録する'),
            ),
          ],
        ),
      ),
    );
  }
}
