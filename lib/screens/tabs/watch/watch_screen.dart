import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ten_twenty_task/configs/helper/common.dart';
import 'package:ten_twenty_task/configs/helper/extensions.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:ten_twenty_task/routes/routes.dart';
import 'package:ten_twenty_task/screens/search/search_screen.dart';
import 'package:ten_twenty_task/screens/tabs/watch/bloc/watch_bloc.dart';
import 'package:ten_twenty_task/screens/tabs/watch/bloc/watch_state.dart';
import 'package:ten_twenty_task/screens/tabs/watch/view/watch_itemview.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyOfWatchScreen(),
    );
  }

  ///Here  will Define  the body of the Screen
  Widget bodyOfWatchScreen() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonWidgets().makeDynamicText(
                text: "Watch", size: 18, color: AppTheme.cT!.appColor),
            const Icon(Icons.search, size: 30).clickListener(
              click: () => Navigate.pushNamed(const WatchSearchScreen()),
            )
          ],
        ),
        watchList()
      ],
    );
  }

  ///Here we will define the listview builder of the watch
  Widget watchList() {
    return Expanded(
      child: AnimationLimiter(
        child: BlocBuilder<WatchBloc, WatchState>(builder: (context, state) {
          if (state is WatchInitialState || state is WatchLoadingState) {
            return CupertinoActivityIndicator(radius: 14.w.h).centralized();
          } else if (state is WatchLoadedState) {
            return ListView.builder(
              itemCount: state.watchModel.watchResultModel!.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 800),
                  child: SlideAnimation(
                    horizontalOffset: 20,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 800),
                    child: FadeInAnimation(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: WatchItemView(
                            watchResultModel:
                                state.watchModel.watchResultModel![index]),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            ///Here we can place our error Widget
            return CommonWidgets()
                .makeDynamicText(text: "Something Went Wrong", size: 18)
                .centralized();
          }
        }),
      ),
    );
  }

  ///This Will show the Questions List in GridView
  Widget showGridList(WatchLoadedState state) {
    return GridView.builder(
      itemCount: state.watchModel.watchResultModel!.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 20.h),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 130,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 800),
          columnCount: 2,
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: WatchItemView(
                    watchResultModel:
                        state.watchModel.watchResultModel![index]),
              ),
            ),
          ),
        );
      },
    );
  }
}
