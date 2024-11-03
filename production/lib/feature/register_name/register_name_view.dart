import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/constants/strings.dart';
import 'package:production/feature/regist_profile/regist_my_experience_view.dart';
import 'package:production/feature/regist_profile/register_profile_view_model.dart';
import 'package:production/feature/register_profile/register_profile_view.dart';

class RegisterNameView extends ConsumerStatefulWidget {
  @override
  _RegisterNameViewState createState() => _RegisterNameViewState();
}

class _RegisterNameViewState extends ConsumerState<RegisterNameView> {
  final TextEditingController nameController = TextEditingController();
  final RegisterProfileViewModel registerProfileViewModel =
      RegisterProfileViewModel();
  int? selectedIconIndex; // 選択されたアイコンのインデックス
  String? selectedTeam; // 選択されたチーム名

  // 仮のチーム名リスト
  final List<String> teamNames = [
    'チームごった煮', '&AIハッカソン部大阪チーム', 'FukuokaFlutterFanclub', '&AIハッカソン部東京チーム',
    'origin master', 'PlayGround', 'ほぼドコドア', 'チームプラゴ',
    'Diamond', 'アジャイルビギナーズリターンズ', 'ながたま', 'windy',
    'マリディ', 'UI=F(State)', 'TK-Studio', 'BEENgineer'
  ];

  // 入力されていない項目を取得
  List<String> _getIncompleteFields() {
    List<String> incompleteFields = [];
    if (nameController.text.isEmpty) incompleteFields.add('名前');
    if (selectedTeam == null) incompleteFields.add('チーム名');
    if (selectedIconIndex == null) incompleteFields.add('アイコンの選択');
    return incompleteFields;
  }

  // ダイアログを表示するメソッド
  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // チーム選択ダイアログ
  void _showTeamSelectionDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('チームを選択'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: teamNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(teamNames[index]),
                  onTap: () {
                    Navigator.pop(context, teamNames[index]);
                  },
                );
              },
            ),
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedTeam = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    registerProfileViewModel.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // アプリアイコン（選択されたアイコンを表示）
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: selectedIconIndex != null
                    ? Image.asset(
                        'assets/images/icon${selectedIconIndex! + 1}.png',
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Text(
                          'アイコンを選んで',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
              ),
              const SizedBox(height: 30),

              // アイコンの丸いボタン
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIconIndex = index; // アイコン選択時にインデックスを更新
                        });
                      },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: selectedIconIndex == index
                            ? Colors.blue
                            : Colors.grey[300],
                        backgroundImage:
                            AssetImage('assets/images/icon${index + 1}.png'),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // 名前入力
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: '名前',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // チーム名のドロップダウンボタン（カスタムダイアログ使用）
              GestureDetector(
                onTap: _showTeamSelectionDialog,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedTeam ?? 'チーム名を選択',
                        style: TextStyle(
                          color: selectedTeam == null ? Colors.black54 : Colors.black,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // スタートボタン
              ElevatedButton(
                onPressed: () {
                  final incompleteFields = _getIncompleteFields();
                  if (incompleteFields.isEmpty) {
                    registerProfileViewModel.saveUserId(returnUuidV4());
                    registerProfileViewModel.saveName(nameController.text);
                    registerProfileViewModel.saveTeamName(selectedTeam!);
                    registerProfileViewModel.saveIcon(selectedIconIndex!);
                    // フォームが完了している場合、完了メッセージをダイアログで表示
                    _showDialog('成功！', '完了しました。');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistMyExperienceView()),
                    );
                  } else {
                    // フォームが完了していない場合、未入力項目をダイアログで表示
                    _showDialog(
                      'エラー',
                      '以下の項目を入力してください\n\n' + incompleteFields.join('\n'),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'Start',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}