// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class CounterInCartIncrementEvent {}

class CounterInCartClearEvent {}

@immutable
class CartState {
  final int value;
  const CartState({
    this.value = 0,
  });

  factory CartState.initial() => const CartState();

  CartState copyWith({
    int? value,
  }) {
    return CartState(
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'CartState(value: $value)';
}

final incrementReducer = combineReducers<int>([
  TypedReducer<int, CounterInCartIncrementEvent>(_increment),
  TypedReducer<int, CounterInCartClearEvent>(_clear),
]);

int _increment(int state, CounterInCartIncrementEvent action) => state++;
int _clear(int state, CounterInCartClearEvent action) => state = 0;

CartState cartReducer(CartState state, action) {
  return state.copyWith(value: incrementReducer(state.value, action));
}

class ViewModel {
  final int value;
  final VoidCallback onIncrease;
  final VoidCallback onClear;

  ViewModel({
    required this.value,
    required this.onIncrease,
    required this.onClear,
  });

  static ViewModel fromStore(Store<CartState> store) => ViewModel(
      value: store.state.value,
      onIncrease: () => store.dispatch(CounterInCartIncrementEvent()),
      onClear: store.dispatch(CounterInCartClearEvent()));
}
