// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';

// import '../../../core/data/network/dio/auth_dio_client.dart';
// import '../../../core/data/network/model/base_response.dart';
// import '../../../domain/entity/user_entity.dart';
// import '../../data.dart';
// import '../mapper/user_mapper.dart';
// import 'user_api.dart';

// @LazySingleton(as: UserApi)
// class UserApi {
//   UserApi(this._dioClient, this._userMapper);

//   final AuthDioClient _dioClient;
//   final UserMapper _userMapper;

//   @override
//   Future<BaseResponse<UserEntity>> deleteUser(UserEntity data) async {
//     try {
//       final Response<dynamic> response = await _dioClient.dio.delete(
//         '/user/${data.id}',
//       );

//       return BaseResponse<UserEntity>.fromJson(response.data, (
//         Object? json,
//       ) {
//         final UserModel model = UserModel.fromJson(
//           json! as Map<String, dynamic>,
//         );
//         return _userMapper.mapToEntity(model);
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<List<UserEntity>> getListUser() async {
//     try {
//       final Response<dynamic> response = await _dioClient.dio.get('/users');

//       return <UserEntity>[];
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<List<UserEntity>> getPagingUser() async {
//     try {
//       final Response<dynamic> response = await _dioClient.dio.get('/users');

//       return <UserEntity>[];
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<BaseResponse<UserEntity>> getUserByID(int id) async {
//     try {
//       final Response<dynamic> response = await _dioClient.dio.get(
//         '/user/$id',
//       );

//       return BaseResponse<UserEntity>.fromJson(response.data, (
//         Object? json,
//       ) {
//         final UserModel model = UserModel.fromJson(
//           json! as Map<String, dynamic>,
//         );
//         return _userMapper.mapToEntity(model);
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<BaseResponse<UserEntity>> insertUser(UserEntity data) async {
//     try {
//       final Response<dynamic> response = await _dioClient.dio.post(
//         '/user',
//         data: data.toJson(),
//       );

//       return BaseResponse<UserEntity>.fromJson(response.data, (
//         Object? json,
//       ) {
//         final UserModel model = UserModel.fromJson(
//           json! as Map<String, dynamic>,
//         );
//         return _userMapper.mapToEntity(model);
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<BaseResponse<UserEntity>> updateUser(UserEntity data) async {
//     try {
//       final Response<dynamic> response = await _dioClient.dio.put(
//         '/user',
//         data: data.toJson(),
//       );

//       return BaseResponse<UserEntity>.fromJson(response.data, (
//         Object? json,
//       ) {
//         final UserModel model = UserModel.fromJson(
//           json! as Map<String, dynamic>,
//         );
//         return _userMapper.mapToEntity(model);
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
