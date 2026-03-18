import 'package:bloc/bloc.dart';
import 'package:cinescope/features/movies/domain/entities/movie.dart';
import 'package:cinescope/features/movies/domain/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;
  int currentpage = 1;
  List<Movie> movies = [];
  MovieBloc(this.repository) : super(MovieInitial()) {
    on<FetchTrendingMovies>(_fetchMovies);
   // on<FetchMoreTrendingMovies>(_loadMore);
  }
  Future<void> _fetchMovies(
    FetchTrendingMoviesevent,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());
    final result = await repository.getTrendingMovies(1);
    movies = result;
    emit(MovieLoaded(movies));
  }
}
