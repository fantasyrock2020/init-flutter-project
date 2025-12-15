import 'package:core/data/network/dio/base_dio_client.dart' show BaseDioClient;
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@InjectableInit.microPackage()
void initMicroDataPackage() {}

@module
abstract class RegisterDataModule {
  @lazySingleton
  Dio dio() => BaseDioClient().dio;
}
