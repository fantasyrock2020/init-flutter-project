import 'package:injectable/injectable.dart';

import '../../../../core/data/network/mapper/base_mapper.dart';
import '../../../../domain/entities/todo/todo_entity.dart';
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
