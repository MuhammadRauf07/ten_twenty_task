import 'package:flutter/material.dart';
import 'package:ten_twenty_task/configs/helper/common.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';

class WatchDetailScreen extends StatelessWidget {
  final int? movieId;

  const WatchDetailScreen({super.key, this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CommonWidgets().makeDynamicText(
                  text: "Movie  Trailer",
                  size: 22,
                  color: AppTheme.cT!.appBlueColor),
              background: Image.asset(
                'assets/images/trailer_image.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonWidgets().makeDynamicText(
                        text: "OverView", size: 22, weight: FontWeight.w800)
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
