import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ten_twenty_task/configs/helper/common.dart';
import 'package:ten_twenty_task/configs/helper/extensions.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:ten_twenty_task/routes/routes.dart';
import 'package:ten_twenty_task/screens/gridview/movies_grid_screen.dart';
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
        Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonWidgets().makeDynamicText(
                    text: "Watch", size: 18, color: AppTheme.cT!.appColor),
                const Icon(Icons.search, size: 30),
              ],
            ).clickListener(
              click: () => Navigate.pushNamed(const MovieGridScreen()),
            )),
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
}
