import 'package:core/core.dart';

@InjectableInit.microPackage()
void initMicroDataPackage() {}

@module
abstract class RegisterDataModule {
  @lazySingleton
  Dio dio() => BaseDioClient().dio;
}
