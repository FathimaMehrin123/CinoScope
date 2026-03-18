import 'package:cinescope/features/movies/data/datasources/movie_remote_datasource.dart';
import 'package:cinescope/features/movies/domain/entities/movie.dart';
import 'package:cinescope/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remote;
  MovieRepositoryImpl(this.remote);
  @override
  Future<List<Movie>> getMovieDetails(int page) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getPopularMovies(int page) {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTrendingMovies(int page) async {
    final response = await remote.getTrendingMovies(page);
    return response.movies;
  }

  @override
  Future<List<Movie>> searchMovies(int page) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
