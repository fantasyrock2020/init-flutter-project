import '../entities/entities.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getListTodo();
  Future<List<TodoEntity>> getPagingTodo();
  Future<TodoEntity?> insertTodo(TodoEntity data);
  Future<TodoEntity?> updateTodo(TodoEntity data);
  Future<TodoEntity?> deleteTodo(TodoEntity data);
  Future<TodoEntity?> getTodoByID(int id);
}
