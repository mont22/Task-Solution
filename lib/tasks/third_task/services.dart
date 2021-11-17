import 'dart:convert';

import 'package:http/http.dart' as http;

import '../third_task/third_task_constants.dart';

class APIService {
  static var client = http.Client();
  static Future getMoviesSortByPopularity() async {
    http.Response response =
        await client.get(Uri.parse(ThirdTaskConstants.MoviesByPopularity));

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['results'];
      return data;
    } else {
      return null;
    }
  }
}
