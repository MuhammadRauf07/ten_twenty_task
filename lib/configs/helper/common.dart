import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_core_theme.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:ten_twenty_task/routes/routes.dart';

class CommonWidgets {
  ///Make  Text with dynamic size and weight
  Widget makeDynamicText({String? text,
    double? size,
    FontWeight? weight,
    Color? color,
    int? lines,
    double? letterSpacing,
    TextAlign? align}) {
    return Text(
      text!,
      maxLines: lines ?? 100,
      textAlign: align ?? TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: commonTextStyle(color, size, weight, letterSpacing: letterSpacing),
    );
  }

  ///Custom AppBar
  Widget customAppBar({Function? callBack, appBarColor, text}) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 50.h),
      child: Row(
        children: [
          SizedBox(
            width: 50.w,
            height: 50.h,
            child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: appBarColor!),
                  onPressed: () {
                    if (callBack != null) {
                      callBack.call();
                    } else {
                      Navigate.pop();
                    }
                  },
                )),
          ),
          10.width,
          makeDynamicText(
              text: text ?? "",
              size: 28,
              weight: FontWeight.w600,
              color: appBarColor),
        ],
      ),
    );
  }

  ///Common TextStyle
  TextStyle commonTextStyle(color, double? size, weight,
      {showUnderLine, letterSpacing}) {
    return TextStyle(
        color: color ?? AppCoreTheme().appColorLight,
        fontSize: size!.w,
        decoration: showUnderLine != null && showUnderLine
            ? TextDecoration.underline
            : TextDecoration.none,
        fontFamily: 'Poppins',
        fontWeight: weight ?? FontWeight.normal,
        letterSpacing: letterSpacing ?? -0.03);
  }

  ///This Method to call to show the SnackBar message
  void showSnackBar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ///Gradient rounded button
  Widget customButton({String? text,
    Function? callBack,
    bool? showIcon,
    String? icon,
    Color? iconColor,
    buttonColor}) {
    return GestureDetector(
      onTap: () {
        callBack!();
      },
      child: Container(
        height: 52.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor ?? AppTheme.cT!.appColorLight,
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: makeDynamicText(
              size: 18,
              text: text,
              weight: FontWeight.w600,
              color: AppTheme.cT!.appWhiteColor),
        ),
      ),
    );
  }

  ///Gradient rounded button
  Widget customBorderedButton(
      {String? text,
      Function? callBack,
      bool? showIcon,
      String? icon,
      Color? iconColor,
      buttonColor}) {
    return GestureDetector(
      onTap: () {
        callBack!();
      },
      child: Container(
        height: 52.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            border: Border.all(
                width: 1.5, color: buttonColor ?? AppTheme.cT!.appColorLight)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow, color: AppTheme.cT!.appWhiteColor),
              makeDynamicText(
                  size: 18,
                  text: text,
                  weight: FontWeight.w600,
                  color: AppTheme.cT!.appWhiteColor),
            ],
          ),
        ),
      ),
    );
  }

  /// Get the Random Color
  Color returnRandomColor() {
    Random random = Random();
    // Generate random RGB values
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);

    // Calculate luminance to determine brightness
    double luminance = 0.2126 * red + 0.7152 * green + 0.0722 * blue;

    // If the luminance is above a certain threshold, adjust the color to be darker
    if (luminance > 40) {
      red = (red * 0.5).round();
      green = (green * 0.5).round();
      blue = (blue * 0.5).round();
    }

    // Return the color
    return Color.fromRGBO(red, green, blue, 1.0);
  }
}
