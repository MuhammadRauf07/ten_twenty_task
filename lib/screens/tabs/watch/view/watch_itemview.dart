import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ten_twenty_task/configs/helper/common.dart';
import 'package:ten_twenty_task/configs/helper/extensions.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:ten_twenty_task/routes/routes.dart';
import 'package:ten_twenty_task/screens/detail/watch_detail_screen.dart';
import 'package:ten_twenty_task/screens/tabs/watch/model/result_model.dart';

class WatchItemView extends StatelessWidget {
  final WatchResultModel? watchResultModel;

  const WatchItemView({super.key, this.watchResultModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.w),
            child: SizedBox(
              height: 250.h,
              width: MediaQuery.sizeOf(context).width,
              child: CachedNetworkImage(
                key: UniqueKey(),
                imageUrl: watchResultModel!.backdropPath!,
                errorWidget: (_, __, ___) {
                  return Image.network(watchResultModel!.backdropPath!);
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 15.w,
            child: CommonWidgets().makeDynamicText(
                size: 22,
                weight: FontWeight.w800,
                text: watchResultModel!.originalTitle,
                color: AppTheme.cT!.appWhiteColor),
          )
        ],
      ),
    ).clickListener(click: () => Navigate.pushNamed(const WatchDetailScreen()));
  }
}
