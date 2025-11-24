import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../network/dio/base_dio_client.dart';

@module
abstract class RegisterDataModule {
  @lazySingleton
  Dio dio() => BaseDioClient().dio;
}
