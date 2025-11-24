part of 'todo_bloc.dart';

@freezed
abstract class TodoTodoEvent with _$TodoTodoEvent {
  const factory TodoTodoEvent.started() = _Started;
  const factory TodoTodoEvent.getAll() = _GetAll;
  const factory TodoTodoEvent.insert() = _Insert;
  const factory TodoTodoEvent.update() = _Update;
  const factory TodoTodoEvent.delete() = _Delete;
}
