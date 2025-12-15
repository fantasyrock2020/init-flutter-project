import 'package:core/data/network/mapper/base_mapper.dart' show BaseDataMapper;
import 'package:domain/entities/entities.dart';
import 'package:injectable/injectable.dart';

import '../../../models/user/user_model.dart';

@lazySingleton
class UserMapper extends BaseDataMapper<UserModel, UserEntity> {
  @override
  UserEntity? mapToEntity(UserModel? data) {
    if (data == null) {
      return null;
    }
    return UserEntity.fromJson(data.toJson());
  }

  @override
  UserModel mapToModel(UserEntity entity) {
    return UserModel.fromJson(entity.toJson());
  }
}
