import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_management_counter_app/cubit/counter_cubit.dart';

import '../cubit/counter_states.dart';
import '../cubit/theme _states.dart';
import '../cubit/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            BlocBuilder<ThemeCubit, ThemeStates>(
              builder: (context, state) {
                return Align(
                  alignment: Alignment.topCenter,
                  child: SwitchListTile(
                    title: const Text('Dark Mode'),
                    secondary: const Icon(Icons.dark_mode),
                    value: state.isDark,
                    onChanged: (value){
                      context.read<ThemeCubit>().toggleTheme();
                      // SharedPreferences save_theme =
                      //     await SharedPreferences.getInstance();
                      // save_theme.setBool('isDark', value);
                    },
                  ),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have pushed the button this many times:'),
                SizedBox(height: 10),
                BlocBuilder<CounterCubit, CounterStates>(
                  builder: (context, state) {
                    return Text(
                      state.count.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            tooltip: 'decrement',
            child: const Icon(Icons.remove_rounded),
          ),
        ],
      ),
    );
  }
}
