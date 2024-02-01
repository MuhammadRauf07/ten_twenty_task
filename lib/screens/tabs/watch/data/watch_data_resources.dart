import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:ten_twenty_task/screens/tabs/watch/model/watch_model.dart';

class WatchDataResources {
  ///Preferably to place it .env file. just for now placing here and place base url  Globally.
  final String apiKey = "39ec16c2cd41963c34a0452f74d6c6bb";
  final String baseUrl = "https://api.themoviedb.org/3/movie/upcoming";

  Future<WatchModel> getWatchList() async {
    final response = await http
        .get(Uri.parse(baseUrl).replace(queryParameters: {"api_key": apiKey}));

    developer.log("userResponse ::${response.body}");

    if (response.statusCode == 200) {
      return WatchModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load watch list');
    }
  }
}
