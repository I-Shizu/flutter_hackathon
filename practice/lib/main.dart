import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice/post/post_view.dart';
import 'package:practice/providers.dart';
import 'package:practice/top/top_view.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Review App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // PostScreenをトップ画面に設定
      home: BottomNavigator(),
    );
  }
}

class BottomNavigator extends ConsumerWidget {
  const BottomNavigator({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavigationIndexProvider);

    List<Widget> _pages = <Widget>[
      TopScreen(),
      PostScreen(),
    ];


    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'post'),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(bottomNavigationIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}