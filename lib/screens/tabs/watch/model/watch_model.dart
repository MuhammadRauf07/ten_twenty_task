import 'package:ten_twenty_task/screens/tabs/watch/model/result_model.dart';

class WatchModel {
  int? page;
  int? totalPages;
  int? totalResults;
  DateModel? dateModel;
  List<WatchResultModel>? watchResultModel;

  WatchModel({
    this.page,
    this.totalPages,
    this.totalResults,
    this.dateModel,
    this.watchResultModel,
  });

  factory WatchModel.fromJson(Map<String, dynamic> json) {
    return WatchModel(
      page: json['page'],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
      dateModel:
          json['dates'] != null ? DateModel.fromJson(json['dates']) : null,
      watchResultModel: json['results'] != null
          ? List<WatchResultModel>.from(
              json["results"].map((e) => WatchResultModel.fromJson(e)))
          : null,
    );
  }
}

class DateModel {
  String? maximum;
  String? minimum;

  DateModel({this.maximum, this.minimum});

  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel(
      maximum: json["maximum"],
      minimum: json["minimum"],
    );
  }
}
