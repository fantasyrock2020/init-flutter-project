//@GeneratedMicroModule;DataPackageModule;package:data/di/data.injector.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data/datasource/api/mapper/todo_mapper.dart' as _i683;
import 'package:data/datasource/api/mapper/user_mapper.dart' as _i617;
import 'package:data/datasource/api/todo/todo_api.dart' as _i375;
import 'package:data/datasource/api/user/user_api.dart' as _i884;
import 'package:data/di/data.injector.dart' as _i119;
import 'package:data/repositories/todo_repository_impl.dart' as _i366;
import 'package:data/repositories/user_repository_impl.dart' as _i537;
import 'package:dio/dio.dart' as _i361;
import 'package:domain/repositories/repositories.dart' as _i604;
import 'package:injectable/injectable.dart' as _i526;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final registerDataModule = _$RegisterDataModule();
    gh.lazySingleton<_i683.TodoMapper>(() => _i683.TodoMapper());
    gh.lazySingleton<_i617.UserMapper>(() => _i617.UserMapper());
    gh.lazySingleton<_i361.Dio>(() => registerDataModule.dio());
    gh.lazySingleton<_i375.TodoApi>(() => _i375.TodoApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i884.UserApi>(() => _i884.UserApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i604.TodoRepository>(() => _i366.TodoRepositoryImpl(
          gh<_i375.TodoApi>(),
          gh<_i683.TodoMapper>(),
        ));
    gh.lazySingleton<_i604.UserRepository>(() => _i537.UserRepositoryImpl(
          gh<_i884.UserApi>(),
          gh<_i617.UserMapper>(),
        ));
  }
}

class _$RegisterDataModule extends _i119.RegisterDataModule {}
