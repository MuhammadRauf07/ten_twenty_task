import 'package:ten_twenty_task/screens/detail/model/detail_model.dart';

///Main State
abstract class DetailState {}



///This is the  initial state
class DetailInitialState extends DetailState {}



///Loaded State
class DetailLoadedState extends DetailState {
  MovieDetailModel? movieDetailModel;

  DetailLoadedState({this.movieDetailModel});
}


///Loading State
class DetailLoadingState extends DetailState {}


///Watch Error State
class DetailErrorState extends DetailState {
  final String error;

  DetailErrorState({required this.error});
}
