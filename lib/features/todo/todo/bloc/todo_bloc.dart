import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../../../domain/entities/todo/todo_entity.dart';
import '../../../../domain/repositories/repositories.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

@injectable
class TodoTodoBloc extends BaseBloc<TodoTodoEvent, TodoTodoState> {
  TodoTodoBloc(this._todoRepository) : super(const TodoTodoState()) {
    on<_Started>(_onStarted);
    on<_GetAll>(_onGetAll);
    on<_Insert>(_onInsert);
    on<_Update>(_onUpdate);
    on<_Delete>(_onDelete);

    add(const TodoTodoEvent.started());
  }

  final TodoRepository _todoRepository;

  Future<void> _onStarted(_Started event, Emitter<TodoTodoState> emit) async {
    add(const TodoTodoEvent.getAll());
  }

  Future<void> _onGetAll(_GetAll event, Emitter<TodoTodoState> emit) async {
    callDataService(
      action: _todoRepository.getListTodo,
      doOnSuccess: (List<TodoEntity> value) async {},
    );
  }

  Future<void> _onInsert(_Insert event, Emitter<TodoTodoState> emit) async {}

  Future<void> _onUpdate(_Update event, Emitter<TodoTodoState> emit) async {}

  Future<void> _onDelete(_Delete event, Emitter<TodoTodoState> emit) async {}
}
