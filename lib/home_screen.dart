import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/slider_provider.dart';

// Define a counter provider
final counter = StateProvider<int>((ref) => 0);

final switchProvider = StateProvider<bool>((ref) => false);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('print');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final slider = ref.watch(sliderProvider);
                print('build eye');
                return InkWell(
                  onTap: () {
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state = stateProvider.state
                        .copyWith(showPassword: !slider.showPassword);
                  },
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: slider.showPassword
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.image),
                  ),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final slider = ref.watch(sliderProvider);
                print('box');
                return Container(
                  height: 200,
                  width: 200,
                  color: Colors.red.withOpacity(slider.slider),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final slider = ref.watch(sliderProvider);
                return Slider(
                  value: slider.slider,
                  onChanged: (value) {
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state =
                        stateProvider.state.copyWith(slider: value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
