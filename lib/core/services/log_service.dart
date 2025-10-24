import 'package:logger/logger.dart';

mixin LogService {
  Logger logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  void logInfo(String message) {
    logger.i(message);
  }

  void logWarning(String message) {
    logger.w(message);
  }

  void logError(String message, [Object? error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }
}
