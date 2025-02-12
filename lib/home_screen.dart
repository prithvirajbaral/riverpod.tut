import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/provider/favorite_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod App'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ref.read(favouriteProvider.notifier).favouriteList(value);
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: 'all',
                  child: Text('All'),
                ),
                PopupMenuItem(
                  value: 'Favourite',
                  child: Text('Favourite'),
                ),
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                hintText: 'search', border: OutlineInputBorder()),
            onChanged: (value) {
              ref.read(favouriteProvider.notifier).filterList(value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favouriteList.filteredItems.length,
              itemBuilder: (context, index) {
                final item = favouriteList.filteredItems[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Icon(
                      item.favourite ? Icons.favorite : Icons.favorite_border),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
