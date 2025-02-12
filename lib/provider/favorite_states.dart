import '../model/item.dart';

class FavoriteStates {
  final List<Item> allItems;
  final List<Item> filteredItems;
  final String search;

  FavoriteStates({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });

  FavoriteStates copyWith({
    List<Item>? allItems,
    List<Item>? filteredItems,
    String? search,
  }) {
    return FavoriteStates(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }
}
