import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production/feature/sample_counter/sample_counter_view_model.dart';

class SampleCounterView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sampleCounter = ref.watch(sampleCounterViewModelProvider);
    final sampleCounterNotifier =
        ref.watch(sampleCounterViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$sampleCounter',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sampleCounterNotifier.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
