import '../entities/entities.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getListUser();
  Future<List<UserEntity>> getPagingUser();
  Future<UserEntity?> insertUser(UserEntity data);
  Future<UserEntity?> updateUser(UserEntity data);
  Future<UserEntity?> deleteUser(UserEntity data);
  Future<UserEntity?> getUserByID(int id);
}
