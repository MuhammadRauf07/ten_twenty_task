import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ten_twenty_task/configs/constants/assets.dart';
import 'package:ten_twenty_task/configs/helper/common.dart';
import 'package:ten_twenty_task/configs/helper/extensions.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:ten_twenty_task/routes/routes.dart';
import 'package:ten_twenty_task/screens/search/search_screen.dart';
import 'package:ten_twenty_task/screens/tabs/watch/bloc/watch_bloc.dart';
import 'package:ten_twenty_task/screens/tabs/watch/bloc/watch_event.dart';
import 'package:ten_twenty_task/screens/tabs/watch/bloc/watch_state.dart';
import 'package:ten_twenty_task/screens/tabs/watch/view/watch_itemview.dart';

class MovieGridScreen extends StatelessWidget {
  const MovieGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: movieGridScreenBody(context),
    );
  }

  ///Here  will Define  the body of the Screen
  Widget movieGridScreenBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 12.w, right: 12.w, top: 50.h, bottom: 20.h),
          child: searchBar(),
        ),
        watchList(context)
      ],
    );
  }

  ///Here we will define the listview builder of the watch
  Widget watchList(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
          child: showGridList()),
    );
  }





  ///Here we will define the listview builder of the watch
  Widget showGridList() {
    return Expanded(
      child: AnimationLimiter(
        child: BlocBuilder<WatchBloc, WatchState>(builder: (context, state) {
          if (state is WatchInitialState || state is WatchLoadingState) {
            return CupertinoActivityIndicator(radius: 14.w.h).centralized();
          } else if (state is WatchLoadedState) {
            return GridView.builder(
              itemCount: state.watchModel.watchResultModel!.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 20.h),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 120,
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


  ///
  Widget searchBar() {
    return Container(
      height: 52.h,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: ShapeDecoration(
        color: AppTheme.cT!.greyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.w),
        ),
      ),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Tv shows movies and more",
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.normal),
            prefixIcon: IconButton(
              onPressed: () {},
              icon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset(AssetsItems.searchIcon),
              ),
            ),
            suffixIcon: IconButton(
                onPressed: () {},
                icon: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(AssetsItems.crossIcon))),
            contentPadding: const EdgeInsets.only(top: 12)),
      ),
    ).clickListener(click: () => Navigate.pushNamed(const SearchScreen()));
  }
}
