import 'package:bloc/bloc.dart';


import '../models/todo_model.dart';



class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([
    Todo(
      name: 'Beşiktaş',
      createdAt: DateTime(1903), // Initializing with the year 1903
    )
  ]);

  void addTodo(String name) {
    final todo = Todo(
      name: name,
      createdAt: DateTime.now(),
    );
    emit([...state, todo]);
  }
}