import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/item_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod App'),
      ),
      body: item.isEmpty
          ? const Center(child: Text('No data found'))
          : ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                final itemDetail = item[index];
                return ListTile(
                  title: Text(itemDetail.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref
                              .read(itemProvider.notifier)
                              .deleteItem(itemDetail.id);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(itemProvider.notifier)
                              .updateItem(itemDetail.id, 'updated item');
                        },
                        icon: const Icon(Icons.edit),
                      )
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('hi item');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
