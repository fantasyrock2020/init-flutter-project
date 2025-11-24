import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async =>
    getIt.init(environment: environment, environmentFilter: environmentFilter);
