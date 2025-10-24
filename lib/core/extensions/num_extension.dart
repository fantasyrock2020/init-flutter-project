import 'package:intl/intl.dart';

extension NumExtension on num? {
  /// Returns 0 if the number is null.
  num get orZero => this ?? 0;

  /// Returns true if the number is null or zero.
  bool get isNullOrZero => this == null || this == 0;

  /// Returns true if the number is not null and not zero.
  bool get isNotZero => (this ?? 0) != 0;

  /// Returns true if the number is positive.
  bool get isPositive => (this ?? 0) > 0;

  /// Returns true if the number is negative.
  bool get isNegative => (this ?? 0) < 0;

  /// Formats number as currency (default: USD)
  String formatCurrency({String symbol = r'$', int decimals = 2}) {
    final num value = this ?? 0;
    final NumberFormat format = NumberFormat.currency(symbol: symbol, decimalDigits: decimals);
    return format.format(value);
  }

  /// Formats number as percentage (e.g. 12.3%)
  String formatPercent({int decimals = 1}) {
    final num value = (this ?? 0) * 100;
    return '${value.toStringAsFixed(decimals)}%';
  }

  /// Returns value as double safely.
  double get toDoubleSafe => (this ?? 0).toDouble();

  /// Returns value as int safely.
  int get toIntSafe => (this ?? 0).toInt();

  /// Returns the absolute value.
  num get absValue => (this ?? 0).abs();

  /// Returns percentage of this number relative to [total].
  double percentOf(num total) {
    if (total == 0) {
      return 0;
    }
    return ((this ?? 0) / total) * 100;
  }

  /// Linear interpolation between this and [end] by [t] (0..1)
  double lerp(num end, double t) {
    final num start = this ?? 0;
    return start + (end - start) * t;
  }

  /// Returns this number formatted as "1.2K", "3.4M", etc.
  String get compact {
    final num value = this ?? 0;
    final NumberFormat format = NumberFormat.compact();
    return format.format(value);
  }

  /// Converts bytes to a human-readable string (KB, MB, GB).
  String get bytesToReadable {
    final num value = this ?? 0;
    const List<String> units = <String>['B', 'KB', 'MB', 'GB', 'TB'];
    double size = value.toDouble();
    int unitIndex = 0;

    while (size >= 1024 && unitIndex < units.length - 1) {
      size /= 1024;
      unitIndex++;
    }

    return '${size.toStringAsFixed(2)} ${units[unitIndex]}';
  }
}
