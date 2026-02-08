import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_counter_app/screen/home_screen.dart';

import 'cubit/counter_cubit.dart';
import 'cubit/theme _states.dart';
import 'cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.isDark ? ThemeData.dark() : ThemeData.light(),
            home: const HomeScreen(title: 'Flutter Demo Home Page'),
          );
        }
      ),
    );
  }
}
