import 'package:cinescope/features/movies/data/models/paginated_movie_response.dart';
import 'package:dio/dio.dart';

class MovieRemoteDataSource {
  final Dio dio;
  MovieRemoteDataSource(this.dio);
  Future<PaginatedMovieResponse> getTrendingMovies(int page) async {
 final response=   await dio.get("/trending/movie/day",queryParameters:{
        "api_key": '7b7a806c717da5a236698c46bf08e015',
        "page":page
    });
    return PaginatedMovieResponse.fromJson(response.data);   
  }
}
