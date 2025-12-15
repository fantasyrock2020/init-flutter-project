import 'package:bloc/bloc.dart';
import 'package:core/services/logger_service.dart' show LoggerService;

class MyBlocObserver extends BlocObserver with LoggerService {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    logInfo('[Bloc Observer] onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logInfo('[Bloc Observer] onChange -- ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logError('[Bloc Observer] onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    logInfo('[Bloc Observer] onClose -- ${bloc.runtimeType}');
  }
}
