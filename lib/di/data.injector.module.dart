//@GeneratedMicroModule;ProjectStructurePackageModule;package:project_structure/di/data.injector.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:project_structure/features/home/home/bloc/home_bloc.dart'
    as _i405;

class ProjectStructurePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i405.HomeHomeBloc>(() => _i405.HomeHomeBloc());
  }
}
