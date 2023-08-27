import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterInCartProvider =
    StateNotifierProvider<CounterInCart, int>((_) => CounterInCart());

class CounterInCart extends StateNotifier<int> {
  CounterInCart() : super(0);
  int value = 0;

  void increment() => state++;

  void clear() => state = 0;
}
