import '../../core/data/network/base/base_response.dart';
import '../entities/entities.dart';

abstract class UserRepository {
  Future<BaseResponse<List<UserEntity>>> getListUser();
  Future<BaseResponse<List<UserEntity>>> getPagingUser();
  Future<BaseResponse<UserEntity>> insertUser(UserEntity data);
  Future<BaseResponse<UserEntity>> updateUser(UserEntity data);
  Future<BaseResponse<UserEntity>> deleteUser(UserEntity data);
  Future<BaseResponse<UserEntity>> getUserByID(int id);
}
