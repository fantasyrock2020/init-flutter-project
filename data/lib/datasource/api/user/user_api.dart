import 'package:core/data/network/base/base_response.dart' show BaseResponse;
import 'package:dio/dio.dart';
import 'package:domain/entities/entities.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/user/user_model.dart';

part 'user_api.g.dart';

@lazySingleton
@RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class UserApi {
  @factoryMethod
  factory UserApi(Dio dio) = _UserApi;

  @DELETE('/delete')
  Future<BaseResponse<UserModel>> deleteUser(@Query('id') int id);

  @GET('/users')
  Future<BaseResponse<List<UserModel>>> getListUser();

  @GET('/users')
  Future<BaseResponse<List<UserModel>>> getPagingUser();

  @GET('/user')
  Future<BaseResponse<UserModel>> getUserByID(@Query('id') int id);

  @POST('/insert')
  Future<BaseResponse<UserModel>> insertUser(@Body() UserEntity data);

  @POST('/update')
  Future<BaseResponse<UserModel>> updateUser(@Body() UserEntity data);
}
