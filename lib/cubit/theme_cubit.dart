import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_management_counter_app/cubit/theme%20_states.dart';

class ThemeCubit extends Cubit<ThemeStates>{
  ThemeCubit(bool startTheme): super(ThemeInit(startTheme));

  void toggleTheme() async{
    bool newTheme = !state.isDark;
    emit(ThemeUpdate(newTheme));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', newTheme);

  }
}