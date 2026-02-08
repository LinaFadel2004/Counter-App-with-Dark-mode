import 'package:bloc/bloc.dart';
import 'package:state_management_counter_app/cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit(): super(CounterInit());

  void increment(){
    emit(CounterUpdate(state.count + 1));
  }

  void decrement(){
    emit(CounterUpdate(state.count - 1));
  }
}