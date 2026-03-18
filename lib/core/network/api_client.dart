import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  ApiClient(this.dio){
    dio.options.baseUrl="https://api.themoviedb.org/3";
    
  }

}
