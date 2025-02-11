import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a counter provider
final counter = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build1");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counter);
                print("build2");
                return Text(
                  count.toString(),
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(counter.notifier).state++;
              },
              child: const Text("+"),
            ),
          ],
        ),
      ),
    );
  }
}
