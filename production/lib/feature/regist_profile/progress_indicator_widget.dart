// progress_indicator_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'progress_provider.dart';

class ProgressIndicatorWidget extends ConsumerWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(currentStepProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: LinearProgressIndicator(
            value: currentStep / totalSteps,
            backgroundColor: Colors.grey[300],
            //valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
        Text('$currentStep / $totalSteps ステップ'),
        const SizedBox(height: 16),
      ],
    );
  }
}
