import 'package:flutter/material.dart';

class AppCoreTheme {
  Color? appColor;
  Color? appColorLight;
  Color? appColorDark;
  Color? appBlackColor;
  Color? appWhiteColor;
  Color? appBlackColorLight;
  Color? appBlackColorDark;

  AppCoreTheme({
    this.appColor,
    this.appColorLight,
    this.appColorDark,
    this.appBlackColor,
    this.appWhiteColor,
    this.appBlackColorLight,
    this.appBlackColorDark,
  });

  /// Method to create a copy of AppCoreTheme
  AppCoreTheme copyWith({
    Color? appColor,
    Color? appColorLight,
    Color? appColorDark,
    Color? appBlackColor,
    Color? appWhiteColor,
    Color? appBlackColorLight,
    Color? appBlackColorDark,
  }) {
    return AppCoreTheme(
      appColor: appColor ?? this.appColor,
      appColorLight: appColorLight ?? this.appColorLight,
      appColorDark: appColorDark ?? this.appColorDark,
      appBlackColor: appBlackColor ?? this.appBlackColor,
      appWhiteColor: appWhiteColor ?? this.appWhiteColor,
      appBlackColorLight: appBlackColorLight ?? this.appBlackColorLight,
      appBlackColorDark: appBlackColorDark ?? this.appBlackColorDark,
    );
  }
}
