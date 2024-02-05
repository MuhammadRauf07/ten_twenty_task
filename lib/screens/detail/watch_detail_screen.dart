import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty_task/configs/helper/common.dart';
import 'package:ten_twenty_task/configs/helper/extensions.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:ten_twenty_task/routes/routes.dart';
import 'package:ten_twenty_task/screens/detail/bloc/detail_bloc.dart';
import 'package:ten_twenty_task/screens/detail/bloc/detail_event.dart';
import 'package:ten_twenty_task/screens/detail/bloc/detail_state.dart';
import 'package:ten_twenty_task/screens/video/show_trailer_video.dart';

class WatchDetailScreen extends StatelessWidget {
  final int? movieId;

  const WatchDetailScreen({super.key, this.movieId});

  @override
  Widget build(BuildContext context) {
    context
        .read<DetailBloc>()
        .add(FetchDetailEvent(movieId: movieId!.toString()));

    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is DetailLoadedState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 2,
                    width: MediaQuery.sizeOf(context).width,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height / 2,
                          width: MediaQuery.sizeOf(context).width,
                          child: CachedNetworkImage(
                            key: UniqueKey(),
                            imageUrl: state.movieDetailModel!.posterPath,
                            errorWidget: (_, __, ___) {
                              return Image.network(
                                  state.movieDetailModel!.posterPath);
                            },
                            fit: BoxFit.fill,
                          ),
                        ),
                        ticketsAndTrailer(state),
                        CommonWidgets().customAppBar(
                            text: "Watch",
                            appBarColor: AppTheme.cT!.appWhiteColor,
                            callBack: () => Navigate.pop()),
                      ],
                    ),
                  ),
                  20.height,
                  showGeneAndOverView(state)
                ],
              ),
            );
          } else if (state is DetailErrorState) {
            return const Text("Something Went Wrong").centralized();
          } else {
            return const CupertinoActivityIndicator(radius: 16).centralized();
          }
        },
      ),
    );
  }

  /// Make Column of Tickets and Trailer  Button
  ticketsAndTrailer(DetailLoadedState state) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          CommonWidgets().makeDynamicText(
              size: 18,
              weight: FontWeight.w600,
              text: "In Theaters ${state.movieDetailModel!.releaseDate}",
              color: AppTheme.cT!.appWhiteColor),
          SizedBox(height: 10.h),
          SizedBox(
            width: 250.w,
            child: CommonWidgets().customButton(
                text: "Get Tickets",
                buttonColor: AppTheme.cT!.appBlueColorLight),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: 250.w,
            child: CommonWidgets().customBorderedButton(
                text: "Watch Trailer",
                callBack: () => Navigate.pushNamed(CustomVideoPlayerScreen(
                    movieId: state.movieDetailModel!.id.toString())),
                buttonColor: AppTheme.cT!.appBlueColorLight),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  ///Show Generes and OverView
  Widget showGeneAndOverView(DetailLoadedState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonWidgets().makeDynamicText(
              text: "Generes",
              size: 22,
              weight: FontWeight.w600,
              color: AppTheme.cT!.appBlueColor),
          20.height,
          SizedBox(
            height: 40.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: state.movieDetailModel!.genres.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 30.h,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10.w),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                        color: CommonWidgets().returnRandomColor(),
                        borderRadius: BorderRadius.circular(22.w)),
                    child: CommonWidgets().makeDynamicText(
                        text: state.movieDetailModel!.genres[index].name,
                        size: 16,
                        weight: FontWeight.w600,
                        color: AppTheme.cT!.appWhiteColor),
                  );
                }),
          ),
          20.height,
          CommonWidgets().makeDynamicText(
              text: "OverView",
              size: 22,
              weight: FontWeight.w600,
              color: AppTheme.cT!.appBlueColor),
          20.height,
          CommonWidgets().makeDynamicText(
              text: state.movieDetailModel!.overview,
              size: 16,
              weight: FontWeight.w400,
              color: AppTheme.cT!.appBlackColor),
        ],
      ),
    );
  }
}
