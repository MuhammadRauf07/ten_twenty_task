import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:ten_twenty_task/configs/constants/constants.dart';
import 'package:ten_twenty_task/screens/detail/model/detail_model.dart';

class DetailDataResources {
  Future<MovieDetailModel> getMovieDetail({String? id}) async {
    final response = await http.get(Uri.parse("${Constants.baseUrl}$id")
        .replace(queryParameters: {"api_key": Constants.apiKey}));

    developer.log("userResponse ::${response.body}");

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load watch list');
    }
  }
}
