extension StringExtension on String? {
  bool get isNullOrEmpty => this?.trim().isEmpty ?? true;

  bool get isNotEmptyOrNull => this?.trim().isNotEmpty ?? false;

  String capitalize() {
    final String? value = this;
    if (value == null || value.isEmpty) {
      return value ?? '';
    }
    return value[0].toUpperCase() + value.substring(1);
  }

  String get titleCase {
    final String? value = this;
    if (value == null || value.trim().isEmpty) {
      return '';
    }
    return value
        .split(' ')
        .map((String word) =>
            word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  String get lower => this?.toLowerCase() ?? '';

  String get upper => this?.toUpperCase() ?? '';

  bool get isEmail {
    final String? value = this;
    if (value == null) {
      return false;
    }
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  bool get isPhone {
    final String? value = this;
    if (value == null) {
      return false;
    }
    return RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value.replaceAll(' ', ''));
  }

  bool get isNumeric => double.tryParse(this ?? '') != null;

  bool get isAlphabet {
    final String? value = this;
    if (value == null) {
      return false;
    }
    return RegExp(r'^[a-zA-Z]+$').hasMatch(value);
  }

  bool get isAlphanumeric {
    final String? value = this;
    if (value == null) {
      return false;
    }
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);
  }

  bool get isUrl {
    final String? value = this;
    if (value == null) {
      return false;
    }
    return Uri.tryParse(value)?.hasAbsolutePath ?? false;
  }

  bool get isIpAddress {
    final String? value = this;
    if (value == null) {
      return false;
    }
    return RegExp(r'^(\d{1,3}\.){3}\d{1,3}$').hasMatch(value);
  }

  String get removeSpaces => this?.replaceAll(' ', '') ?? '';

  String get reversed => this == null ? '' : this!.split('').reversed.join();

  String get toCamelCase {
    final String? value = this;
    if (value == null || value.isEmpty) {
      return '';
    }
    final List<String> parts = value.split('_');
    if (parts.isEmpty) {
      return value;
    }
    return parts.first +
        parts.skip(1).map((String e) => e.capitalize()).join();
  }

  String get toSnakeCase {
    final String? value = this;
    if (value == null) {
      return '';
    }
    return value.replaceAllMapped(
        RegExp('([A-Z])'), (Match m) => '_${m[0]!.toLowerCase()}');
  }

  String truncate(int maxLength) {
    final String value = this ?? '';
    if (value.length <= maxLength) {
      return value;
    }
    return '${value.substring(0, maxLength)}...';
  }

  String get onlyDigits => this?.replaceAll(RegExp('[^0-9]'), '') ?? '';

  String get onlyLetters => this?.replaceAll(RegExp('[^a-zA-Z]'), '') ?? '';
}
