abstract class VideoEvent {}

class FetchVideoEvent extends VideoEvent {
  String? movieId;

  FetchVideoEvent({this.movieId});
}
