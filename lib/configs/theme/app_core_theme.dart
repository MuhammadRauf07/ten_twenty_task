import 'package:flutter/material.dart';

class AppCoreTheme {
  Color? appColor;
  Color? appColorLight;
  Color? appBlueColor;
  Color? greyColor;
  Color? appWhiteColor;

  AppCoreTheme({
    this.appColor,
    this.appColorLight,
    this.appBlueColor,
    this.greyColor,
    this.appWhiteColor,
  });

  /// Method to create a copy of AppCoreTheme
  AppCoreTheme copyWith({
    Color? appColor,
    Color? appColorLight,
    Color? appBlueColor,
    Color? greyColor,
    Color? appWhiteColor,
  }) {
    return AppCoreTheme(
      appColor: appColor ?? this.appColor,
      appColorLight: appColorLight ?? this.appColorLight,
      appBlueColor: appBlueColor ?? this.appBlueColor,
      greyColor: greyColor ?? this.greyColor,
      appWhiteColor: appWhiteColor ?? this.appWhiteColor,
    );
  }
}
