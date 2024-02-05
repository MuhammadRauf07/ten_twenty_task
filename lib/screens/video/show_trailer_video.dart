import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty_task/configs/helper/common.dart';
import 'package:ten_twenty_task/configs/helper/extensions.dart';
import 'package:ten_twenty_task/configs/helper/screen_util.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:ten_twenty_task/screens/video/bloc/video_bloc.dart';
import 'package:ten_twenty_task/screens/video/bloc/video_event.dart';
import 'package:ten_twenty_task/screens/video/bloc/video_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoPlayerScreen extends StatefulWidget {
  final String? movieId;

  const CustomVideoPlayerScreen({super.key, this.movieId});

  @override
  CustomVideoPlayerScreenState createState() => CustomVideoPlayerScreenState();
}

class CustomVideoPlayerScreenState extends State<CustomVideoPlayerScreen> {
  YoutubePlayerController? _videoPlayerController;
  bool _isPlaying = true;
  bool _isMuted = false;
  bool _isFullScreen = false;
  late Timer _timer;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  bool isResolutionLoaded = false;
  double _aspectRatio = 16 / 9;

  @override
  void initState() {
    super.initState();

    context
        .read<VideoBloc>()
        .add(FetchVideoEvent(movieId: widget.movieId!.toString()));
    setVideoController();
  }

  ///Set Video Controller
  setVideoController({String? videoId}) {
    _videoPlayerController = YoutubePlayerController(
      initialVideoId: 'CHKn-yDCE2w',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(
      builder: (context, orientation) {
        return BlocBuilder<VideoBloc, VideoState>(builder: (context, state) {
          if (state is VideoLoadedState) {
            /*for (var data in state.trailerModel!.trailerDataModelList!) {
              if (data.type == "Trailer") {
                setVideoController(videoId: data.key);
                break;
              }
            }*/

            return Stack(
              children: [
                Positioned(
                  top: 50.h,
                  child: CommonWidgets().customAppBar(
                      text: "Trailer", appBarColor: AppTheme.cT!.appWhiteColor),
                ),
                videoView(),
              ],
            );
          } else if (state is VideoErrorState) {
            return const Text("Something went Wrong").centralized();
          } else {
            return const CupertinoActivityIndicator(radius: 15).centralized();
          }
        });
      },
    ));
  }

  ///Video View
  Widget videoView() {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: AppTheme.cT!.appBlueColor!,
      child: YoutubePlayer(
        controller: _videoPlayerController!,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
            playedColor: Colors.blue, bufferedColor: Colors.grey),
        onReady: () {
          // Add listeners for play, pause, etc. events here
        },
      ),
    );
  }

  ///Check Device is in portrait or landscape mood
  bool checkIfDeviceOrientationPortrait(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    if (currentOrientation == Orientation.landscape) {
      return true;
    } else {
      return false;
    }
  }
}
