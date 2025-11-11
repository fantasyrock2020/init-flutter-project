import 'dart:ui';

class AppColors {
  const AppColors.light({
    this.primary = const Color(0x0fffffff),
    this.error = const Color(0xfffafafa),
  });

  const AppColors.dark({
    this.primary = const Color(0x0ff00000),
    this.error = const Color(0xfffafafa),
  });

  final Color primary;
  final Color error;
}
