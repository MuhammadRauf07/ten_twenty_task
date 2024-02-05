import 'package:flutter/material.dart';

import 'app_core_theme.dart';

class AppTheme {
  /// Init The AppCore Theme
  static AppCoreTheme? cT;

  static init(BuildContext context) {
    cT = isDark(context) ? dark : light;
  }

  ///Check The App Theme
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  ///App Core Theme
  static final _core = AppCoreTheme(
    appWhiteColor: Colors.white,
    appColor: const Color(0xFF4F3422),
    appColorLight: Colors.black12,
    appBlackColor: Colors.black54,
    appBlueColor: const Color(0xFF2E2739),
    greyColor: const Color(0xFFEFEFEF),
    darkGrey: const Color(0xFFF2F2F6),
  );

  ///App Core Light theme
  static AppCoreTheme light = _core.copyWith(
    ///TODO IMPLEMENTATION
  );

  ///App Core Dark Theme
  static AppCoreTheme dark = _core.copyWith(
    ///TODO IMPLEMENTATION
  );
}
