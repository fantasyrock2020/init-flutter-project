import 'package:injectable/injectable.dart';
import '../../core/data/network/base/base_response.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasource/api/mapper/user_mapper.dart';
import '../datasource/api/user/user_api.dart';
import '../models/user/user_model.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userApi, this._userMapper);

  final UserApi _userApi;
  final UserMapper _userMapper;

  @override
  Future<BaseResponse<UserEntity>> deleteUser(UserEntity data) async {
    try {
      final BaseResponse<UserModel> result = await _userApi.deleteUser(data.id);
      return BaseResponse<UserEntity>(
        status: result.status,
        data: _userMapper.mapToEntity(result.data),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<UserEntity>>> getListUser() async {
    try {
      final BaseResponse<List<UserModel>> result = await _userApi.getListUser();
      return BaseResponse<List<UserEntity>>(
        status: result.status,
        data:
            result.data
                ?.map((UserModel user) => _userMapper.mapToEntity(user)!)
                .toList() ??
            <UserEntity>[],
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<UserEntity>>> getPagingUser() async {
    try {
      final BaseResponse<List<UserModel>> result = await _userApi
          .getPagingUser();
      return BaseResponse<List<UserEntity>>(
        status: result.status,
        data:
            result.data
                ?.map((UserModel user) => _userMapper.mapToEntity(user)!)
                .toList() ??
            <UserEntity>[],
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<UserEntity>> getUserByID(int id) async {
    try {
      final BaseResponse<UserModel> result = await _userApi.getUserByID(id);
      return BaseResponse<UserEntity>(
        status: result.status,
        data: _userMapper.mapToEntity(result.data),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<UserEntity>> insertUser(UserEntity data) async {
    try {
      final BaseResponse<UserModel> result = await _userApi.insertUser(data);
      return BaseResponse<UserEntity>(
        status: result.status,
        data: _userMapper.mapToEntity(result.data),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<UserEntity>> updateUser(UserEntity data) async {
    try {
      final BaseResponse<UserModel> result = await _userApi.updateUser(data);
      return BaseResponse<UserEntity>(
        status: result.status,
        data: _userMapper.mapToEntity(result.data),
      );
    } catch (e) {
      rethrow;
    }
  }
}
