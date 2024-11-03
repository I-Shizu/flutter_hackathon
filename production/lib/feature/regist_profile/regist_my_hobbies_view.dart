import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/feature/regist_profile/progress_indicator_widget.dart';
import 'package:production/feature/regist_profile/progress_provider.dart';
import 'package:production/feature/regist_profile/regist_want_experience_view.dart';
import 'package:production/feature/regist_profile/register_profile_view_model.dart';

class RegistMyHobbiesView extends ConsumerWidget {
  const RegistMyHobbiesView({super.key});

  Future<void> _playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/next_btn.mp3'));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RegisterProfileViewModel registerProfileViewModel =
        RegisterProfileViewModel();
    registerProfileViewModel.setRef(ref);
    final formKey = GlobalObjectKey<FormState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール登録'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProgressIndicatorWidget(), // 進捗バーのウィジェットを追加
              const Text(
                'hotなハマっていること\n（改行で区切って3つまで登録可能)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Form(
                key: formKey,
                child: TextFormField(
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return '最低一つ登録してください';
                    }
                    if (value.length > 100) {
                      return '100文字以内で入力してください';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    final hobbies = value!
                        .split('\n')
                        .where((hobby) => hobby.trim().isNotEmpty)
                        .toList();
                    registerProfileViewModel.saveProfileHobbies(hobbies);
                  },
                  maxLines: 3,
                  maxLength: 100,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                    isDense: true,
                    hintText: '藤井風\nスポーツ読書\n映画鑑賞',
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
                      await _playSound(); // 効果音を再生
                      if (context.mounted) {
                        ref
                            .read(currentStepProvider.notifier)
                            .update((state) => state + 1);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RegistWantExperienceView(),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('次へ', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}