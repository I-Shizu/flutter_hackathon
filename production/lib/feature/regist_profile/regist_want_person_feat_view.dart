import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/feature/matching_user_list/matching_user_list_view.dart';
import 'package:production/feature/regist_profile/regist_want_experience_view.dart';
import 'package:production/feature/regist_profile/register_profile_view_model.dart';

class RegistWantPersonFeatView extends ConsumerWidget {
  const RegistWantPersonFeatView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RegisterProfileViewModel registerProfileViewModel =
        RegisterProfileViewModel();
    registerProfileViewModel.setRef(ref);
    final formKey = GlobalObjectKey<FormState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('繋がりたい人の情報'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '繋がりたい人を一言で',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Form(
                key: formKey,
                child: TextFormField(
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return '何かしら入力してください';
                    }
                    if (value.length > 100) {
                      return '40文字以内で入力してください';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    registerProfileViewModel.saveProfilePersonFeat(value!);
                  },
                  maxLines: 2,
                  maxLength: 40,
                  //expands: true,
                  // cursorColor: AppColorTheme.color().mainColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                    isDense: true,
                    hintText: 'キャリアの相談に乗ってくれる人',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey[500]!,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 56),
              Center(
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(280, 48)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await registerProfileViewModel.sendMyData();
                      // print('myProfile: ${registerProfileViewModel.myProfile}');
                      if (context.mounted) {
                        // 遷移処理
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MatchingUserListView(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      }
                    }
                  },
                  child: const Text('登録完了', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
