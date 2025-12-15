import 'package:data/di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:project_structure/di/data.injector.module.dart'
    show ProjectStructurePackageModule;
import 'injector.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  includeMicroPackages: false,
  externalPackageModulesBefore: [
    ExternalModule(ProjectStructurePackageModule),
    ExternalModule(DataPackageModule),
  ],
)
Future<void> configureInjection({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async =>
    getIt.init(environment: environment, environmentFilter: environmentFilter);
