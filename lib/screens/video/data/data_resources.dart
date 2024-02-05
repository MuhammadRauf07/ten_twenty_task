import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:ten_twenty_task/configs/constants/constants.dart';
import 'package:ten_twenty_task/screens/video/model/trailer_model.dart';

class VideoDataResources {
  Future<TrailerModel> getVideoDetail({String? id}) async {
    final response = await http.get(Uri.parse("${Constants.baseUrl}$id/videos")
        .replace(queryParameters: {"api_key": Constants.apiKey}));

    developer.log("userResponse ::${response.body}");

    if (response.statusCode == 200) {

      return TrailerModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load watch list');
    }
  }
}
