import 'package:flutter/material.dart';

class RegisterConnectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("プロフィール登録画面")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Flutterエンジニアとしての経験', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              _ExperienceButton(label: '初心者（1年未満）'),
              _ExperienceButton(label: '中級者（1年以上3年未満）'),
              _ExperienceButton(label: '上級者（3年以上）'),
              SizedBox(height: 24),
              ElevatedButton(onPressed: () {}, child: Text('次へ')),
            ],
          ),
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
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, textAlign: TextAlign.center),
    );
  }
}