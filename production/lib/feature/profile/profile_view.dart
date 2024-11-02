import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("相手のプロフィール見れる画面")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundColor: Colors.grey[300]),
            SizedBox(height: 8),
            Text('Beengineer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('しずく', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            _ExperienceButton(label: '中級者（1年以上3年未満）'),
            _ExperienceButton(label: '中級者（1年以上3年未満）'),
            _ExperienceButton(label: '中級者（1年以上3年未満）'),
          ],
        ),
      ),
    );
  }
}

class _ExperienceButton extends StatelessWidget {
  final String label;

  const _ExperienceButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, textAlign: TextAlign.center),
    );
  }
}