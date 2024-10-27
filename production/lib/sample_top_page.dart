import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:production/feature/sample_cloudstorage/sample_cloud_storage_view.dart';
import 'package:production/feature/sample_firestore/sample_list_view.dart';

class SampleTopPage extends StatelessWidget {
  const SampleTopPage({Key? key}) : super(key: key);

  void _showSampleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sample Dialog'),
        content:
            const Text('This is a sample dialog to demonstrate the theme.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Top Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SVGファイルの表示
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  'assets/images/undraw_home_run_acyh.svg',
                  height: 200, // 任意のサイズに調整
                  width: 200,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SampleListView(),
                    ),
                  );
                },
                child: const Text('Go to Firestore Sample Page'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SampleCloudStorageView(),
                    ),
                  );
                },
                child: const Text('Go to Cloud Storage Sample Page'),
              ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      Text('This is a sample card'),
                      SizedBox(height: 8),
                      Text('It demonstrates the card theme styling'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _showSampleDialog(context),
                child: const Text('Show Dialog'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: 'Storage',
          ),
        ],
      ),
    );
  }
}
