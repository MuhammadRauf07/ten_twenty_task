import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ten_twenty_task/configs/constants/assets.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:ten_twenty_task/screens/search/view/item_view.dart';
import 'package:ten_twenty_task/screens/tabs/watch/bloc/watch_bloc.dart';
import 'package:ten_twenty_task/screens/tabs/watch/bloc/watch_event.dart';
import 'package:ten_twenty_task/screens/tabs/watch/bloc/watch_state.dart';
import 'package:ten_twenty_task/screens/tabs/watch/model/result_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: searchScreenBody(context),
    );
  }



  ///Search Screen Body
  Widget searchScreenBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 12.w, right: 12.w, top: 50.h, bottom: 20.h),
          child: searchBar(),
        ),
        watchList(context),
      ],
    );
  }


  /// Watch List
  Widget watchList(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        child: BlocBuilder<WatchBloc, WatchState>(
          builder: (context, state) {
            if (state is WatchLoadedState) {
              return searchList(state, context);
            } else {
              context.read<WatchBloc>().add(FetchWatchEvent());
              return const Center(child: CupertinoActivityIndicator());
            }
          },
        ),
      ),
    );
  }

  ///Search Screen List, with Filtration
  Widget searchList(WatchLoadedState state, BuildContext context) {
    final List<WatchResultModel> filteredList = state.watchModel.watchResultModel!
        .where((item) => item.originalTitle!.toLowerCase().contains(textEditingController.text.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredList.length,
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
                child: SearchItemView(watchResultModel: filteredList[index]),
              ),
            ),
          ),
        );
      },
    );
  }



  ///Search Bar
  Widget searchBar() {
    return Container(
      height: 52.h,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: AppTheme.cT!.greyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.w),
        ),
      ),
      child: TextField(
        controller: textEditingController,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Tv shows movies and more",
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(AssetsItems.searchIcon),
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              textEditingController.clear();
              setState(() {});
            },
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(AssetsItems.crossIcon),
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 12),
        ),
      ),
    );
  }
}
