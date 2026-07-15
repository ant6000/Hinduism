import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvdier);
    return Scaffold(
      body: Center(
        child: Text('$counter'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvdier.notifier).increament();
        },
      ),
    );
  }
}

class CounterProvider extends Notifier<int> {
  @override
  build() {
    return 0;
  }

  void increament() {
    state++;
  }
}

final counterProvdier = NotifierProvider<CounterProvider, int>(() => CounterProvider());
