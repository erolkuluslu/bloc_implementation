import 'package:bloc_implementation/bloc/counter_bloc.dart';
import 'package:bloc_implementation/cubit/todo_cubit.dart';
import 'package:bloc_implementation/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_screen.dart';
import 'models/todo_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    final todoTitleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: BlocBuilder<CounterBloc, int>(
          bloc: counterBloc,
          builder: (context, counter) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Warning"),
                          content: const Text("You are about to leave this page"),
                          actions: [
                            TextButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text("Go to Login Page"),
                ),
              ],
            );
          },
        ),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: todoTitleController,
                  decoration: const InputDecoration(hintText: 'Title'),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final title = todoTitleController.text;
                  if (title.isNotEmpty) {
                    // Add the new todo
                    BlocProvider.of<TodoCubit>(context).addTodo(title);

                    // Clear the text field after adding the todo
                    todoTitleController.clear();
                  }
                },
                child: const Text('Add'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(todo.name),
                      subtitle: Text(todo.createdAt.toString()),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: const IncDecPage(),
    );
  }
}
