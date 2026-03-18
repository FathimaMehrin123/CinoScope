part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}
class FetchTrendingMovies extends MovieEvent{}
class FetchMoreTrendingMovies extends MovieEvent{}