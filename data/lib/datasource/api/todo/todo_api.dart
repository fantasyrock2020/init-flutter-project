import 'package:core/data/network/base/base_response.dart' show BaseResponse;
import 'package:dio/dio.dart';
import 'package:domain/entities/entities.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/todo/todo_model.dart';

part 'todo_api.g.dart';

@lazySingleton
@RestApi()
abstract class TodoApi {
  @factoryMethod
  factory TodoApi(Dio dio) = _TodoApi;

  @DELETE('/todos')
  Future<BaseResponse<TodoModel>> deleteTodo(@Query('id') int id);

  @GET('/post')
  Future<BaseResponse<List<TodoModel>>> getListTodo();

  @GET('/todos')
  Future<BaseResponse<List<TodoModel>>> getPagingTodo();

  @GET('/todo')
  Future<BaseResponse<TodoModel>> getTodoByID(@Query('id') int id);

  @POST('/insert')
  Future<BaseResponse<TodoModel>> insertTodo(@Body() TodoEntity data);

  @POST('/update')
  Future<BaseResponse<TodoModel>> updateTodo(@Body() TodoEntity data);
}
