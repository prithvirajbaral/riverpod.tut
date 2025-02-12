import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/model/item.dart';
import 'package:riverpod_tut/provider/favorite_states.dart';

final favouriteProvider =
    StateNotifierProvider<FavoriteNotifier, FavoriteStates>((ref) {
  return FavoriteNotifier();
});

class FavoriteNotifier extends StateNotifier<FavoriteStates> {
  FavoriteNotifier()
      : super(
          FavoriteStates(allItems: [], filteredItems: [], search: ''),
        );

  void addItem() {
    List<Item> item = [
      Item(name: 'MacBook', favourite: true, id: 1),
      Item(name: 'iPhone', favourite: false, id: 2),
      Item(name: 'G-force 3060', favourite: false, id: 3),
      Item(name: 'Samsung Ultra', favourite: true, id: 4),
      Item(name: 'Google Pixel 9', favourite: false, id: 5),
      Item(name: 'iPad Pro 13', favourite: true, id: 6),
    ];

    state =
        state.copyWith(allItems: item.toList(), filteredItems: item.toList());
  }

  void filterList(String search) {
    state = state.copyWith(filteredItems: _filterItems(state.allItems, search));
  }

  void favouriteList(String option) {
    state = state.copyWith(filteredItems: _favItems(state.allItems, option));
  }

  List<Item> _filterItems(List<Item> items, String search) {
    if (search.isEmpty) {
      return items;
    }

    return items
        .where((item) => item.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  List<Item> _favItems(List<Item> items, String option) {
    if (option == 'all') {
      return items;
    }

    return items.where((item) => item.favourite == true).toList();
  }
}
