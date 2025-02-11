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

// for stateful widget

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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




