import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty_task/screens/tabs/watch/bloc/watch_event.dart';
import 'package:ten_twenty_task/screens/tabs/watch/bloc/watch_state.dart';
import 'package:ten_twenty_task/screens/tabs/watch/data/watch_data_resources.dart';
import 'package:ten_twenty_task/screens/tabs/watch/model/watch_model.dart';

class WatchBloc extends Bloc<WatchEvent, WatchState> {

  WatchDataResources watchDataResources = WatchDataResources();


  ///Here we will define all the events
  WatchBloc() : super(WatchInitialState()) {
    on<FetchWatchEvent>(_fetchWatchScreen);
  }


  ///Here we will fetch
  _fetchWatchScreen(FetchWatchEvent event,Emitter<WatchState> emit) async {
    emit(WatchLoadingState());

    try {
      WatchModel watchModel = await watchDataResources.getMovieList(); // Implement the fetchData function
      emit(WatchLoadedState(watchModel: watchModel));
    } catch (error) {

      print("error :: ${error.toString()}");

      emit(WatchErrorState(error: error.toString()));
    }

  }


}