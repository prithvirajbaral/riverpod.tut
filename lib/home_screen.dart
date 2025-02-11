import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// to read value
final hello = Provider<String>(
  (ref) {
    return "hello prithvi";
  },
);

final age = Provider<int>(
  (ref) {
    return 23;
  },
);

// for Stateless widget

// class HomeScreen extends StatelessWidget {

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  // Widget build(BuildContext context) {
  Widget build(BuildContext context, WidgetRef ref) {
    final a = ref.read(hello);
    final b = ref.read(age);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "$a $b",
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}




