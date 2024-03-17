import "dart:convert";

import "package:http/http.dart" as http;
import "package:movie_challenge/models/movies_popular_model.dart";

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "comming-soon";

  static Future<List<MoviePopularModel>> getPopularMovies() async {
    List<MoviePopularModel> popularMovies = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var results = jsonResponse["results"];
      try {
        for (var result in results) {
          // MoviePopularModel.fromJson(result);

          popularMovies.add(MoviePopularModel.fromJson(result));
        }
        print(popularMovies);
        return popularMovies;
      } catch (e) {
        print("Error occurred while parsing MoviePopularModel: $e");
      }
    }
    throw Error();
  }
}
