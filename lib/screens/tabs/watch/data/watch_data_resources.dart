import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:ten_twenty_task/configs/constants/constants.dart';
import 'package:ten_twenty_task/screens/tabs/watch/model/watch_model.dart';

class WatchDataResources {
  Future<WatchModel> getMovieList() async {
    final response = await http.get(Uri.parse("${Constants.baseUrl}upcoming")
        .replace(queryParameters: {"api_key": Constants.apiKey}));

    developer.log("userResponse ::${response.body}");

    if (response.statusCode == 200) {
      return WatchModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load watch list');
    }
  }
}
