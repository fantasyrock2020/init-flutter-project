// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:project_structure/core/data/di/data_injector.dart' as _i368;
import 'package:project_structure/data/datasource/api/mapper/todo_mapper.dart'
    as _i328;
import 'package:project_structure/data/datasource/api/mapper/user_mapper.dart'
    as _i31;
import 'package:project_structure/data/datasource/api/todo/todo_api.dart'
    as _i170;
import 'package:project_structure/data/datasource/api/user/user_api.dart'
    as _i183;
import 'package:project_structure/data/repositories/todo_repository_impl.dart'
    as _i782;
import 'package:project_structure/data/repositories/user_repository_impl.dart'
    as _i169;
import 'package:project_structure/domain/repositories/repositories.dart'
    as _i649;
import 'package:project_structure/domain/repositories/todo_repository.dart'
    as _i266;
import 'package:project_structure/domain/repositories/user_repository.dart'
    as _i742;
import 'package:project_structure/features/home/home/bloc/home_bloc.dart'
    as _i405;
import 'package:project_structure/features/todo/todo/bloc/todo_bloc.dart'
    as _i893;
import 'package:project_structure/features/user_profile/home/bloc/home_bloc.dart'
    as _i903;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerDataModule = _$RegisterDataModule();
    gh.factory<_i405.HomeHomeBloc>(() => _i405.HomeHomeBloc());
    gh.factory<_i903.UserProfileHomeBloc>(() => _i903.UserProfileHomeBloc());
    gh.lazySingleton<_i361.Dio>(() => registerDataModule.dio());
    gh.lazySingleton<_i328.TodoMapper>(() => _i328.TodoMapper());
    gh.lazySingleton<_i31.UserMapper>(() => _i31.UserMapper());
    gh.lazySingleton<_i170.TodoApi>(() => _i170.TodoApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i183.UserApi>(() => _i183.UserApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i266.TodoRepository>(
      () =>
          _i782.TodoRepositoryImpl(gh<_i170.TodoApi>(), gh<_i328.TodoMapper>()),
    );
    gh.lazySingleton<_i742.UserRepository>(
      () =>
          _i169.UserRepositoryImpl(gh<_i183.UserApi>(), gh<_i31.UserMapper>()),
    );
    gh.factory<_i893.TodoTodoBloc>(
      () => _i893.TodoTodoBloc(gh<_i649.TodoRepository>()),
    );
    return this;
  }
}

class _$RegisterDataModule extends _i368.RegisterDataModule {}
