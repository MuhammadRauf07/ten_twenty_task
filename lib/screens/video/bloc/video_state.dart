
import 'package:ten_twenty_task/screens/video/model/trailer_model.dart';

///Main State
abstract class VideoState {}



///This is the  initial state
class VideoInitialState extends VideoState {}



///Loaded State
class VideoLoadedState extends VideoState {
  TrailerModel? trailerModel;

  VideoLoadedState({this.trailerModel});
}


///Loading State
class VideoLoadingState extends VideoState {}


///Watch Error State
class VideoErrorState extends VideoState {
  final String error;

  VideoErrorState({required this.error});
}
