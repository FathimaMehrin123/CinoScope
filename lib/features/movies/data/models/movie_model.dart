import 'package:cinescope/features/movies/domain/entities/movie.dart';

/*
A DTO (Data Transfer Object) is a design pattern used to transfer data between different layers or systems in an application.
*/
class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.overview,
    required super.ratiing,
  });

  factory MovieModel.fromjson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"],
      posterPath: json["poster_path"],
      overview: json['overview'],
      ratiing: (json['vote_average'] ?? 0).toDouble(),
    );
  }
}
