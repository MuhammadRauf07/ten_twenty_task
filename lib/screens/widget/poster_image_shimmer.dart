import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';

class PosterImageShimmer extends StatelessWidget {
  const PosterImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 250.h,
      child: Shimmer.fromColors(
        baseColor: AppTheme.cT!.appColorLight!,
        highlightColor: AppTheme.cT!.appWhiteColor!,
        child: this,
      ),
    );
  }
}
