import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:production/models/other_user_model.dart';

class ProfileView extends StatelessWidget {
  final OtherUserModel otherUser;

  const ProfileView({Key? key, required this.otherUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconNumber = (otherUser.icon % 5) + 1;
    final iconPath = 'assets/images/icon$iconNumber.png';

    return Scaffold(
      appBar: AppBar(title: Text("プロフィール")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: ClipOval(
                child: Image.asset(
                  iconPath,
                  width: 100, // CircleAvatarのサイズに合わせて調整
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              otherUser.teamName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(otherUser.name, style: TextStyle(fontSize: 16)),
            SizedBox(height: 4),
            // Lottieアニメーションの追加
            Lottie.asset(
              otherUser.totalpoint != null && otherUser.totalpoint! >= 80
                  ? 'assets/lottie/morehot_animation.json'
                  : 'assets/lottie/hot_animation.json',
              width: 60, // サイズを調整
              height: 60,
            ),
            SizedBox(height: 16),
            _ProfileCard(label: '経験: ${otherUser.profileExperience}'),
            _ProfileCard(label: '職業: ${otherUser.profileJob}'),
            _ProfileCard(label: '好きなパッケージ: ${otherUser.profileFavPackage}'),
            _ProfileCard(label: '趣味: ${otherUser.profileHobbies.join(', ')}'),
            _ProfileCard(label: '特徴: ${otherUser.profilePersonFeat}'),
            _ProfileCard(label: 'ホット度: ${otherUser.totalpoint.toString()}'),
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
        textAlign: TextAlign.start,
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(text: '$title: '),
            TextSpan(
              text: value,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
