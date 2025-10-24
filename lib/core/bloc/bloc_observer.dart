import 'package:bloc/bloc.dart';

import '../services/log_service.dart';

class MyBlocObserver extends BlocObserver with LogService {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    logger.i('[Bloc Observer] onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logger.i('[Bloc Observer] onChange -- ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.e('[Bloc Observer] onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    logger.i('[Bloc Observer] onClose -- ${bloc.runtimeType}');
  }
}
