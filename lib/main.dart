import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_management_counter_app/screen/home_screen.dart';

import 'cubit/counter_cubit.dart';
import 'cubit/theme _states.dart';
import 'cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool startTheme = prefs.getBool('isDark') ?? false;
  final int startCount = prefs.getInt('count') ?? 0;
  runApp(MyApp(mode: startTheme, count: startCount,));
}

class MyApp extends StatelessWidget {
  final bool mode;
  final int count;

  const MyApp({super.key, required this.mode, required this.count});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(mode)),
        BlocProvider(create: (context) => CounterCubit(count)),
      ],
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.isDark ? ThemeData.dark() : ThemeData.light(),
            home: HomeScreen(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}
