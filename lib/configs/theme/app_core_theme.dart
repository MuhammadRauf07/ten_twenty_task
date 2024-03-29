import 'package:flutter/material.dart';

class AppCoreTheme {
  Color? appColor;
  Color? appColorLight;
  Color? appBlueColor;
  Color? greyColor;
  Color? darkGrey;
  Color? appBlueColorLight;
  Color? appWhiteColor;
  Color? appBlackColor;

  AppCoreTheme({
    this.appColor,
    this.appColorLight,
    this.appBlueColor,
    this.greyColor,
    this.darkGrey,
    this.appWhiteColor,
    this.appBlackColor,
    this.appBlueColorLight,
  });

  /// Method to create a copy of AppCoreTheme
  AppCoreTheme copyWith({
    Color? appColor,
    Color? appColorLight,
    Color? appBlueColor,
    Color? greyColor,
    Color? darkGrey,
    Color? appWhiteColor,
    Color? appBlackColor,
    Color? appBlueColorLight,
  }) {
    return AppCoreTheme(
      appColor: appColor ?? this.appColor,
      appColorLight: appColorLight ?? this.appColorLight,
      appBlueColor: appBlueColor ?? this.appBlueColor,
      greyColor: greyColor ?? this.greyColor,
      darkGrey: darkGrey ?? this.darkGrey,
      appWhiteColor: appWhiteColor ?? this.appWhiteColor,
      appBlackColor: appBlackColor ?? this.appBlackColor,
      appBlueColorLight: appBlueColorLight ?? this.appBlueColorLight,
    );
  }
}
