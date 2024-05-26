import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncremented) {
        emit(state + 1);
      } else if (event is CounterDecremented) {
        emit(state - 1);
      }
    });
  }
}
