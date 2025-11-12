// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:project_structure/data/datasource/api/mapper/user_mapper.dart'
    as _i31;
import 'package:project_structure/data/datasource/api/user/user_api.dart'
    as _i183;
import 'package:project_structure/data/repositories/user_repository_impl.dart'
    as _i169;
import 'package:project_structure/domain/repositories/user_repository.dart'
    as _i742;
import 'package:project_structure/features/user_profile/home/bloc/home_bloc.dart'
    as _i903;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i903.UserProfileHomeBloc>(() => _i903.UserProfileHomeBloc());
    gh.lazySingleton<_i31.UserMapper>(() => _i31.UserMapper());
    gh.lazySingleton<_i742.UserRepository>(
      () => _i169.UserRepositoryImpl(gh<_i183.UserApi>()),
    );
    return this;
  }
}
