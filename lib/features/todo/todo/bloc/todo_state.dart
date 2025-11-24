part of 'todo_bloc.dart';

@freezed
abstract class TodoTodoState with _$TodoTodoState {
  const factory TodoTodoState({
    @Default(false) bool success,
  }) = _TodoTodoState;
}
