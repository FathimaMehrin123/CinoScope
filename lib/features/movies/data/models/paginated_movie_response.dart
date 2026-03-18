import 'package:cinescope/features/movies/data/models/movie_model.dart';

class PaginatedMovieResponse {
  final int page;
  final List<MovieModel> movies;
  PaginatedMovieResponse({required this.page, required this.movies});

  factory PaginatedMovieResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return PaginatedMovieResponse(
      page: json["page"],
      movies: (json['results'] as List)
          .map((e) => MovieModel.fromjson(e))
          .toList(),
    );
  }
}
