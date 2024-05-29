import 'package:bloc_implementation/bloc/counter_bloc.dart';
import 'package:bloc_implementation/cubit/counter_cubit.dart';
import 'package:bloc_implementation/cubit/todo_cubit.dart';
import 'package:bloc_implementation/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocProvider(create:(_) => TodoCubit()),
       // BlocProvider(create:(_) => CounterCubit()),
        BlocProvider(create:(_) => CounterBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Pallete.backgroundColor,
          useMaterial3: true,

        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        home: const MyHomePage(),
      ),
    );
  }
}

