import 'package:flutter/material.dart';
import 'package:ten_twenty_task/configs/theme/app_theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoView extends StatelessWidget {
  final YoutubePlayerController? videoPlayerController;
  const VideoView({super.key,this.videoPlayerController});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: AppTheme.cT!.appBlueColor!,
      child: YoutubePlayer(
        controller: videoPlayerController!,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
            playedColor: Colors.blue, bufferedColor: Colors.grey),
        onReady: () {
          // Add listeners for play, pause, etc. events here
        },
      ),
    );
  }
}
