import 'package:core/data/network/mapper/base_mapper.dart' show BaseDataMapper;
import 'package:domain/entities/entities.dart';
import 'package:injectable/injectable.dart';

import '../../../models/todo/todo_model.dart';

@lazySingleton
class TodoMapper extends BaseDataMapper<TodoModel, TodoEntity> {
  @override
  TodoEntity? mapToEntity(TodoModel? data) {
    if (data == null) {
      return null;
    }
    return TodoEntity.fromJson(data.toJson());
  }

  @override
  TodoModel mapToModel(TodoEntity entity) {
    return TodoModel.fromJson(entity.toJson());
  }
}
