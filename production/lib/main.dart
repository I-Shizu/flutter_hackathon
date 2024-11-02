import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/feature/matching_user_list/matching_user_list_view.dart';
import 'package:production/feature/profile/profile_view.dart';
import 'package:production/feature/register_name/register_name_view.dart';
import 'package:production/sample_top_page.dart';
import 'package:production/theme/themes.dart';
import 'firebase_options.dart';

void main() async {
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
      title: 'Sample App',
      theme: AppTheme.lightTheme,
      // PostScreenをトップ画面に設定
      home: RegisterNameView(),
    );
  }
}
