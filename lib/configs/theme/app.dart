import 'package:flutter/material.dart';
import 'package:freud_ai/configs/theme/app_theme.dart';

class App {
  static bool? isLtr;
  static bool showAds = false;

  static init(BuildContext context) {
    print("ColorThemeInitialization");
    AppTheme.init(context);
  }
}