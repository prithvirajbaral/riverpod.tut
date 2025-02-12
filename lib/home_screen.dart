import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/future_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: provider.when(
            skipLoadingOnRefresh: false,
            // data: (value) => Text(value.toString()), // for first codde of future provider
            data: (value) => ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Text(value[index].toString());
                }),
            error: (error, stack) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.invalidate(futureProvider);
      }),
    );
  }
}
