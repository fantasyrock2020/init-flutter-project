import 'package:core/data/network/base/base_response.dart' show BaseResponse;
import 'package:domain/entities/entities.dart';
import 'package:domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';
import '../datasource/api/mapper/user_mapper.dart';
import '../datasource/api/user/user_api.dart';
import '../models/user/user_model.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userApi, this._userMapper);

  final UserApi _userApi;
  final UserMapper _userMapper;

  @override
  Future<UserEntity?> deleteUser(UserEntity data) => _userApi
      .deleteUser(data.id)
      .then((BaseResponse<UserModel> res) => _userMapper.mapToEntity(res.data));

  @override
  Future<List<UserEntity>> getListUser() => _userApi
      .getListUser()
      .then((BaseResponse<List<UserModel>> res) => res.data)
      .then((List<UserModel>? data) {
        if (data == null) {
          return <UserEntity>[];
        }
        return data
            .map((UserModel user) => _userMapper.mapToEntity(user)!)
            .toList();
      });

  @override
  Future<List<UserEntity>> getPagingUser() => _userApi
      .getPagingUser()
      .then((BaseResponse<List<UserModel>> res) => res.data)
      .then((List<UserModel>? data) {
        if (data == null) {
          return <UserEntity>[];
        }
        return data
            .map((UserModel user) => _userMapper.mapToEntity(user)!)
            .toList();
      });

  @override
  Future<UserEntity?> getUserByID(int id) => _userApi
      .getUserByID(id)
      .then((BaseResponse<UserModel> res) => _userMapper.mapToEntity(res.data));

  @override
  Future<UserEntity?> insertUser(UserEntity data) => _userApi
      .insertUser(data)
      .then((BaseResponse<UserModel> res) => _userMapper.mapToEntity(res.data));

  @override
  Future<UserEntity?> updateUser(UserEntity data) => _userApi
      .updateUser(data)
      .then((BaseResponse<UserModel> res) => _userMapper.mapToEntity(res.data));
}
