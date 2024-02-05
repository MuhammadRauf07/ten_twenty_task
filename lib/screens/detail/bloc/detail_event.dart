abstract class DetailEvent {}

class FetchDetailEvent extends DetailEvent {
  String? movieId;

  FetchDetailEvent({this.movieId});
}
