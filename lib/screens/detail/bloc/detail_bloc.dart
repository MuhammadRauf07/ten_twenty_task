import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty_task/screens/detail/bloc/detail_event.dart';
import 'package:ten_twenty_task/screens/detail/bloc/detail_state.dart';
import 'package:ten_twenty_task/screens/detail/data/data_resources.dart';
import 'package:ten_twenty_task/screens/detail/model/detail_model.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailDataResources detailDataResources = DetailDataResources();

  ///Here we will define all the events
  DetailBloc() : super(DetailInitialState()) {
    on<FetchDetailEvent>(_fetchWatchScreen);
  }

  ///Here we will fetch
  _fetchWatchScreen(FetchDetailEvent event, Emitter<DetailState> emit) async {
    emit(DetailLoadingState());

    try {
      /// Implement the fetchData function
      MovieDetailModel movieDetailModel =
          await detailDataResources.getMovieDetail(id: event.movieId);

      emit(DetailLoadedState(movieDetailModel: movieDetailModel));
    } catch (error) {
      print("error :: ${error.toString()}");

      emit(DetailErrorState(error: error.toString()));
    }
  }
}
