import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty_task/screens/video/bloc/video_event.dart';
import 'package:ten_twenty_task/screens/video/bloc/video_state.dart';
import 'package:ten_twenty_task/screens/video/data/data_resources.dart';
import 'package:ten_twenty_task/screens/video/model/trailer_model.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoDataResources detailDataResources = VideoDataResources();

  ///Here we will define all the events
  VideoBloc() : super(VideoInitialState()) {
    on<FetchVideoEvent>(_fetchWatchScreen);
  }

  ///Here we will fetch
  _fetchWatchScreen(FetchVideoEvent event, Emitter<VideoState> emit) async {
    emit(VideoLoadingState());

    try {
      /// Implement the fetchData function
      TrailerModel movieDetailModel =
          await detailDataResources.getVideoDetail(id: event.movieId);

      emit(VideoLoadedState(trailerModel: movieDetailModel));
    } catch (error) {
      print("error :: ${error.toString()}");

      emit(VideoErrorState(error: error.toString()));
    }
  }
}
