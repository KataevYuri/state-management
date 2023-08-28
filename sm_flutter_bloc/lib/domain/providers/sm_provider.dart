import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterInCartEven { increase, clear }

class CounterInCartBloc extends Bloc<CounterInCartEven, int> {
  int value = 0;

  CounterInCartBloc() : super(0) {
    <CounterInCartEven>(event, emit) {
        if (event == CounterInCartEven.increase)
    };
  }
}
