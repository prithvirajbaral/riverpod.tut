import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, String>(
  (ref) {
    return SearchNotifier();
  },
);

class SearchNotifier extends StateNotifier<String> {
  SearchNotifier() : super('');

  void search(String query) {
    state = query;
  }
}
