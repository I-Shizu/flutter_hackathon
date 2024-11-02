import 'package:flutter/material.dart';
import 'package:production/models/other_user_model.dart';

class ProfileView extends StatelessWidget {
  // 仮のデータを用意して表示用に渡します
  final otherUser = OtherUserModel(
    userId: '123',
    name: 'しずく',
    teamName: 'Beengineer',
    icon: Icons.person.codePoint, // アイコンのコードポイントを使用
    profileExperience: '中級者（1年以上3年未満）',
    profileJob: 'エンジニア',
    profileIsStudent: false,
    profileFavPackage: 'Riverpod',
    profileHobbies: ['釣り', 'アニメ', 'ファッション'],
    profilePersonFeat: '前向きでエネルギッシュ',
    askExperience: '中級者',
    askJob: 'エンジニア',
    askIsStudent: false,
    totalpoint: 4.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("相手のプロフィール見れる画面")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(IconData(otherUser.icon, fontFamily: 'MaterialIcons'), size: 50),
            ),
            SizedBox(height: 8),
            Text(otherUser.teamName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(otherUser.name, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            _ProfileCard(label: '経験: ${otherUser.profileExperience}'),
            _ProfileCard(label: '職業: ${otherUser.profileJob}'),
            _ProfileCard(label: '好きなパッケージ: ${otherUser.profileFavPackage}'),
            _ProfileCard(label: '趣味: ${otherUser.profileHobbies.join(', ')}'),
            _ProfileCard(label: '特徴: ${otherUser.profilePersonFeat}'),
            _ProfileCard(label: '総ポイント: ${otherUser.totalpoint.toString()}'),
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final String label;

  const _ProfileCard({required this.label});

  @override
  Widget build(BuildContext context) {
    // ラベルと値を「: 」で分割
    final parts = label.split(': ');
    final title = parts[0];
    final value = parts.length > 1 ? parts[1] : '';

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: RichText(
        textAlign: TextAlign.start, // 左寄せ
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(text: '$title: '),
            TextSpan(
              text: value,
              style: TextStyle(fontWeight: FontWeight.bold), // 値部分を太字に設定
            ),
          ],
        ),
      ),
    );
  }
}