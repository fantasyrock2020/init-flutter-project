import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  /// Returns true if null or invalid.
  bool get isNull => this == null;

  /// Returns `this` or current DateTime if null.
  DateTime get orNow => this ?? DateTime.now();

  /// Returns only the date (time part removed).
  DateTime get dateOnly => DateTime(orNow.year, orNow.month, orNow.day);

  bool get isToday {
    final DateTime now = DateTime.now();
    final DateTime d = orNow;
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }

  bool get isYesterday {
    final DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    final DateTime d = orNow;
    return d.year == yesterday.year &&
        d.month == yesterday.month &&
        d.day == yesterday.day;
  }

  bool get isTomorrow {
    final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    final DateTime d = orNow;
    return d.year == tomorrow.year &&
        d.month == tomorrow.month &&
        d.day == tomorrow.day;
  }

  bool isSameDay(DateTime? other) {
    if (other == null) {
      return false;
    }
    final DateTime d1 = orNow;
    return d1.year == other.year && d1.month == other.month && d1.day == other.day;
  }

  bool isBeforeDay(DateTime? other) {
    if (other == null) {
      return false;
    }
    return dateOnly.isBefore(other.dateOnly);
  }

  bool isAfterDay(DateTime? other) {
    if (other == null) {
      return false;
    }
    return dateOnly.isAfter(other.dateOnly);
  }

  /// Format with a custom pattern like `yyyy-MM-dd HH:mm`.
  String format([String pattern = 'yyyy-MM-dd HH:mm']) {
    return DateFormat(pattern).format(orNow);
  }

  /// Format to a short date (e.g. `24 Oct 2025`)
  String get formatShort => DateFormat('d MMM yyyy').format(orNow);

  /// Format to a long date (e.g. `Friday, 24 October 2025`)
  String get formatLong => DateFormat('EEEE, d MMMM yyyy').format(orNow);

  /// Format to time only (e.g. `13:45`)
  String get formatTime => DateFormat('HH:mm').format(orNow);

  /// Format to ISO string (e.g. `2025-10-24T13:45:00Z`)
  String get isoString => orNow.toIso8601String();

  Duration differenceFromNow() => DateTime.now().difference(orNow);

  // -------------------------------
  // Add/Subtract helpers
  // -------------------------------

  DateTime addDays(int days) => orNow.add(Duration(days: days));
  DateTime subtractDays(int days) => orNow.subtract(Duration(days: days));

  DateTime addHours(int hours) => orNow.add(Duration(hours: hours));
  DateTime subtractHours(int hours) => orNow.subtract(Duration(hours: hours));

  DateTime addMinutes(int minutes) => orNow.add(Duration(minutes: minutes));
  DateTime subtractMinutes(int minutes) => orNow.subtract(Duration(minutes: minutes));

  /// Returns the weekday number (1 = Monday, 7 = Sunday)
  int get weekdayNumber => orNow.weekday;

  /// Returns true if weekend (Saturday or Sunday)
  bool get isWeekend => orNow.weekday == DateTime.saturday || orNow.weekday == DateTime.sunday;
}
