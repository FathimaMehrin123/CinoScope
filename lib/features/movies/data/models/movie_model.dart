import 'package:cinescope/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {

MovieModel({
required super.id,
required super.title,
required super.posterPath,
required super.overview,
required super.rating,
  });

factory MovieModel.fromJson(Map<String,dynamic>json) {

return MovieModel(
id:json['id'],
title:json['title']??"",
posterPath:json['poster_path']??"",
overview:json['overview']??"",
rating: (json['vote_average']??0).toDouble(),
    );

  }

}