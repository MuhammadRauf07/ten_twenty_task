import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_core_theme.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:ten_twenty_task/routes/routes.dart';

class CommonWidgets {


  ///Make  Text with dynamic size and weight
  Widget makeDynamicText(
      {String? text,
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
    return Row(
      children: [
        SizedBox(
          width: 50.w,
          height: 50.h,
          child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: IconButton(
                icon: SvgPicture.asset("assets/common/back_icon.svg",
                    color: appBarColor),
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
        fontFamily: 'Urbanist',
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
  Widget customButton(
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
        decoration: BoxDecoration(
          color: buttonColor ?? AppTheme.cT!.appColorLight,
          borderRadius: BorderRadius.circular(30.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: makeDynamicText(
                        size: 18,
                        text: text,
                        weight: FontWeight.w800,
                        color: AppTheme.cT!.appWhiteColor),
                  )
                : const SizedBox(),
            showIcon != null
                ? SvgPicture.asset(
                    icon ?? "assets/common/forward_arrow.svg",
                    color: iconColor,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
