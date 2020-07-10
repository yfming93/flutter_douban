import 'package:flutter_douban/model/home_model.dart';
import 'package:flutter_douban/service/http_request.dart';
import 'config.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList (int start) async {
    final movieUrl = "/movie/top250?apikey=${HomeConfig.apikey}&start=$start&count=${HomeConfig.movieCount}";
    final result = await HttpRequest.request(movieUrl);
    final subjects = result["subjects"];
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }
    print("movies:$movies");
    return movies;
  }
}