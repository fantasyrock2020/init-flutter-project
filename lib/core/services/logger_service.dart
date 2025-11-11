import 'package:logger/logger.dart';

mixin LoggerService {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      lineLength: 80,
      excludeBox: <Level, bool>{Level.info: true},
    ),
  );

  void logInfo(String message) {
    _logger.i(message);
  }

  void logWarning(String message) {
    _logger.w(message);
  }

  void logError(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
