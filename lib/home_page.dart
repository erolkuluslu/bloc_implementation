import 'package:bloc_implementation/cubit/counter_cubit.dart';
import 'package:bloc_implementation/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key, required this.title});



  final String title;

 // final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
final counterCubit = BlocProvider.of<CounterCubit>(context);
        return Scaffold(
          appBar: AppBar(

            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
          ),
          body: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterCubit, int>(
                    bloc: counterCubit,
                    builder: (context, counter) {
                    return Text(
                      '$counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                ),
              ],
            ),
          ),
          floatingActionButton: const IncDecPage(),
        );

  }
}
