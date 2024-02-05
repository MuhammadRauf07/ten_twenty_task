import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ten_twenty_task/configs/helper/common.dart';
import 'package:ten_twenty_task/configs/helper/extensions.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:ten_twenty_task/routes/routes.dart';
import 'package:ten_twenty_task/screens/detail/watch_detail_screen.dart';
import 'package:ten_twenty_task/screens/tabs/watch/model/result_model.dart';

class SearchItemView extends StatelessWidget {
  final WatchResultModel? watchResultModel;

  const SearchItemView({super.key, this.watchResultModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.w),
            child: SizedBox(
              height: 100.h,
              width: 100.w,
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
          30.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidgets().makeDynamicText(
                  size: 18,
                  weight: FontWeight.w600,
                  text: watchResultModel!.originalTitle,
                  color: AppTheme.cT!.appBlackColor),
              20.height,
              CommonWidgets().makeDynamicText(
                  size: 18,
                  weight: FontWeight.w400,
                  text: watchResultModel!.originalLanguage,
                  color: AppTheme.cT!.appColorLight),
            ],
          ),
          const Spacer(),
          const Icon(Icons.more_vert)
        ],
      ),
    ).clickListener(
        click: () => Navigate.pushNamed(
            WatchDetailScreen(movieId: watchResultModel!.id!)));
  }
}
