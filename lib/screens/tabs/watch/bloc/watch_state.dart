import 'package:ten_twenty_task/screens/tabs/watch/model/watch_model.dart';


///Main State
abstract class WatchState {}




///This is the  initial state
class WatchInitialState extends WatchState {}



///Loading State
class WatchLoadingState extends WatchState {}



///Watch Loaded state
class WatchLoadedState extends WatchState {
  final WatchModel watchModel;

  WatchLoadedState({required this.watchModel});
}



///Watch Error State
class WatchErrorState extends WatchState {
  final String error;

  WatchErrorState({required this.error});
}
