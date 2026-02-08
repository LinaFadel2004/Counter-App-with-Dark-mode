import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_management_counter_app/cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit(int currentCount): super(CounterInit(currentCount));

  void increment()async{
    int newCount = state.count + 1;
    emit(CounterUpdate(newCount));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('count', newCount);
  }

  void decrement()async{
    if(state.count == 0){
      return;
    }
    int newCount = state.count - 1;
    emit(CounterUpdate(newCount));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('count', newCount);

  }
}