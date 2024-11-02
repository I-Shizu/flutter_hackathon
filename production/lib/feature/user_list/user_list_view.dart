import 'package:flutter/material.dart';

class UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ユーザーリスト画面")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('〇〇さんへのおすすめの人', style: TextStyle(fontSize: 18)),
              SizedBox(height: 24),
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
      ),
    );
  }
}