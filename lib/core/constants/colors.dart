import 'dart:ui';

class AppColors {
  const AppColors.light({
    this.primary = const Color(0x0fffffff),
    this.error = const Color(0xfffafafa),
  });

  const AppColors.dark()
    : this.light(
        primary: const Color(0xff000000),
        error: const Color(0xffededed),
      );

  final Color primary;
  final Color error;
}
