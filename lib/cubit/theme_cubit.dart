import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_counter_app/cubit/theme%20_states.dart';

class ThemeCubit extends Cubit<ThemeStates>{
  ThemeCubit(): super(ThemeInit());

  void DarkMode(){
    emit(ThemeUpdate(!state.isDark));
  }
}