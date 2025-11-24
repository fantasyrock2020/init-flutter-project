import 'package:flutter/material.dart';

import '../../../widget/base_state/base_state_full_widget.dart';
import 'bloc/todo_bloc.dart';

class TodoTodoPage extends StatefulWidget {
  const TodoTodoPage({super.key});

  @override
  State<TodoTodoPage> createState() => _TodoTodoPageState();
}

class _TodoTodoPageState extends BasePageStateFull<TodoTodoPage, TodoTodoBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const Text('data'));
  }
}
