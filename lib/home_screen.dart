import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/search_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                ref.read(searchProvider.notifier).search(value);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer(
              builder: (context, ref, child) {
                final search = ref.watch(searchProvider);
                return Text(
                  search,
                  style: const TextStyle(fontSize: 50),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
