import 'package:flutter/material.dart';

class UserListSearchView extends StatelessWidget {
  final List<String> tags = [
    "#アプリ運営", "#ストア申請", "#日常", "#開発", "#リーダーの本", "#UI", 
    "#打ち合わせ", "#映像制作", "#読書", "#仕事", "#プレゼン"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ユーザーリスト検索画面")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Text('戻るボタン', style: TextStyle(fontSize: 16))),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) => Chip(label: Text(tag))).toList(),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: List.generate(6, (index) {
                  return Column(
                    children: [
                      CircleAvatar(radius: 40, backgroundColor: Colors.grey[300]),
                      SizedBox(height: 8),
                      Text('BEENgineer', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('しずく'),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}