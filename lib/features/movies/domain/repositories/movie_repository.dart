import 'package:cinescope/features/movies/domain/entities/movie.dart';

abstract class MovieRepository {

Future<List<Movie>>getTrendingMovies(int page);

Future<List<Movie>>getPopularMovies(int page);

//Future<MovieDetails>getMovieDetails(int movieId);

Future<List<Movie>>searchMovies(Stringquery,intpage);

}