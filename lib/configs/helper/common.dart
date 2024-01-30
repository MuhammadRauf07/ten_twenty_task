import 'dart:math' as math;

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freud_ai/configs/helper/screen_util.dart';
import 'package:freud_ai/configs/theme/app_core_theme.dart';
import 'package:freud_ai/configs/theme/app_theme.dart';
import 'package:freud_ai/routes/routes.dart';

class CommonWidgets {
  ///Make Grey Text with dynamic size and weight
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

  ///
  Widget backButton({Function? backButton, borderColor}) {
    Color color = borderColor ?? AppTheme.cT!.appColorLight;

    return Container(
      width: 50.w,
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(width: 1.w, color: color)),
      child: SizedBox(
          width: 24.w,
          height: 24.h,
          child: IconButton(
            icon: SvgPicture.asset("assets/common/back_icon.svg", color: color),
            onPressed: () {
              if (backButton != null) {
                backButton();
              } else {
                Navigate.pop();
              }
            },
          )),
    );
  }

  ///
  Widget customAppBar(
      {Function? callBack, borderColor, text, actionIcon, actionWidget,showBackButton}) {
    Color color = borderColor ?? AppTheme.cT!.appColorLight;

    return Row(
      children: [
        showBackButton==null? Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(width: 1.w, color: color)),
          child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: IconButton(
                icon: SvgPicture.asset("assets/common/back_icon.svg",
                    color: color),
                onPressed: () {
                  if (callBack != null) {
                    callBack.call();
                  } else {
                    Navigate.pop();
                  }
                },
              )),
        ):const SizedBox(),
        10.width,
        makeDynamicText(
            text: text ?? "", size: 28, weight: FontWeight.w600, color: color),
        const Spacer(),
        actionIcon != null
            ? SizedBox(
                width: 32.w,
                height: 32.h,
                child: IconButton(
                  icon: SvgPicture.asset("assets/$actionIcon",
                      color: color,
                      fit: BoxFit.cover,
                      width: 32.w,
                      height: 32.h),
                  onPressed: () {
                    callBack!.call();
                  },
                ),
              )
            : actionWidget ?? const SizedBox()
      ],
    );
  }

  ///Make Grey Text with dynamic size and weight
  Widget makeDynamicTextSpan(
      {String? text1,
      String? text2,
      String? text3,
      String? text4,
      double? size1,
      double? size2,
      FontWeight? weight1,
      FontWeight? weight2,
      Color? color1,
      Color? color2,
      Color? color3,
      Color? color4,
      int? lines,
      double? letterSpacing,
      bool? showUnderLine1,
      bool? showUnderLine2,
      bool? showUnderLine3,
      VoidCallback? onText2Click,
      VoidCallback? onText3Click,
      TextAlign? align}) {
    return RichText(
      textAlign: align ?? TextAlign.start,
      text: TextSpan(
        text: text1,
        style: commonTextStyle(color1, size1, weight1,
            letterSpacing: letterSpacing, showUnderLine: showUnderLine1),
        children: [
          TextSpan(
            text: text2,
            style: commonTextStyle(color2, size2 ?? size1, weight2 ?? weight1,
                showUnderLine: showUnderLine2, letterSpacing: letterSpacing),
            recognizer: onText2Click != null
                ? (TapGestureRecognizer()..onTap = onText2Click)
                : null,
          ),
          TextSpan(
            text: text3 ?? "",
            style: commonTextStyle(color3, size1, weight1,
                letterSpacing: letterSpacing, showUnderLine: showUnderLine3),
            recognizer: onText3Click != null
                ? (TapGestureRecognizer()..onTap = onText3Click)
                : null,
          ),
          TextSpan(
            text: text4 ?? "",
            style: commonTextStyle(color4, size1, weight1,
                letterSpacing: letterSpacing, showUnderLine: showUnderLine3),
            recognizer: onText3Click != null
                ? (TapGestureRecognizer()..onTap = onText3Click)
                : null,
          ),
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
                        color: AppTheme.cT!.whiteColor),
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

  ///make a border
  Widget makeBorder() {
    return Container(
      height: 1.h,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.w)),
    );
  }

  ///Custom Radio Button
  Widget customRadioButton(bool isSelected) {
    return Container(
      height: 18.h,
      width: 18.w,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? AppTheme.cT!.whiteColor!
              : AppTheme.cT!.appColorDark!,
          width: 2.0.w,
        ),
      ),
      child: Container(
        height: 16.h,
        width: 16.w,
        decoration: BoxDecoration(
          color: AppTheme.cT!.whiteColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }


  ///
  Widget makeDot({color, double? size}) {
    return Container(
      width: size ?? 5.w,
      height: size ?? 5.h,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  ///Green BoxShadow
  List<BoxShadow> boxShadow() {
    return [
      BoxShadow(
        color: AppTheme.cT!.brownShadow!,
        blurRadius: 0,
        offset: const Offset(0, 0),
        spreadRadius: 4.w,
      )
    ];
  }

  ///Rounded Shape of circle bottom
  Widget roundShapeCircle() {
    return Container(
      width: 960.w,
      height: 960.h,
      decoration: BoxDecoration(
        color: AppTheme.cT!.whiteColor,
        shape: BoxShape.circle,
      ),
    );
  }

  ///Doted Line
  Widget dotedLine() {
    return DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 1.0.w,
      dashLength: 4.0,
      dashColor: AppTheme.cT!.lightGrey!,
      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 0.0,
    );
  }

  /// Get the Random Color
  Color returnRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(0.1);
  }

  ///Insight button to view full health
  Widget ovalButton({BuildContext? context, IconData? iconData, callBack}) {
    return GestureDetector(
      onTap: () {
        if (callBack != null) {
          callBack();
        }
      },
      child: Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: AppTheme.cT!.appColorLight,
          shape: BoxShape.circle,
        ),
        child: Icon(iconData, color: AppTheme.cT!.whiteColor),
      ),
    );
  }

  ///Above the ListViewBuilder Text
  Widget listViewAboveRow({context, text1, text2, callBack}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonWidgets().makeDynamicText(
              text: text1,
              size: 16,
              weight: FontWeight.w800,
              color: AppTheme.cT!.appColorDark),
          GestureDetector(
            onTap: () {
              if (callBack != null) {
                callBack();
              }
            },
            child: CommonWidgets().makeDynamicText(
                text: text2,
                size: 16,
                weight: FontWeight.w800,
                color: AppTheme.cT!.greenColor),
          ),
        ],
      ),
    );
  }
}
