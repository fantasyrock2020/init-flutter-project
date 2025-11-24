import 'package:injectable/injectable.dart';
import '../../core/data/network/base/base_response.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasource/api/mapper/todo_mapper.dart';
import '../datasource/api/todo/todo_api.dart';
import '../models/todo/todo_model.dart';

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl(this._todoApi, this._todoMapper);

  final TodoApi _todoApi;
  final TodoMapper _todoMapper;

  @override
  Future<TodoEntity?> deleteTodo(TodoEntity data) => _todoApi
      .deleteTodo(data.id)
      .then((BaseResponse<TodoModel> res) => _todoMapper.mapToEntity(res.data));

  @override
  Future<List<TodoEntity>> getListTodo() => _todoApi
      .getListTodo()
      .then((BaseResponse<List<TodoModel>> res) => res.data)
      .then((List<TodoModel>? data) {
        if (data == null) {
          return <TodoEntity>[];
        }
        return data
            .map((TodoModel todo) => _todoMapper.mapToEntity(todo)!)
            .toList();
      });

  @override
  Future<List<TodoEntity>> getPagingTodo() => _todoApi
      .getPagingTodo()
      .then((BaseResponse<List<TodoModel>> res) => res.data)
      .then((List<TodoModel>? data) {
        if (data == null) {
          return <TodoEntity>[];
        }
        return data
            .map((TodoModel todo) => _todoMapper.mapToEntity(todo)!)
            .toList();
      });

  @override
  Future<TodoEntity?> getTodoByID(int id) => _todoApi
      .getTodoByID(id)
      .then((BaseResponse<TodoModel> res) => _todoMapper.mapToEntity(res.data));

  @override
  Future<TodoEntity?> insertTodo(TodoEntity data) => _todoApi
      .insertTodo(data)
      .then((BaseResponse<TodoModel> res) => _todoMapper.mapToEntity(res.data));

  @override
  Future<TodoEntity?> updateTodo(TodoEntity data) => _todoApi
      .updateTodo(data)
      .then((BaseResponse<TodoModel> res) => _todoMapper.mapToEntity(res.data));
}
