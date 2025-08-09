import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yj_moive/network/model/business/movie/movie.dart';
import 'package:yj_moive/network/model/response/list.dart';
import 'package:yj_moive/network/model/response/result.dart';
import 'package:yj_moive/service/log/logger.dart';

import 'model/business/movie/cast.dart';

part 'index.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3', callAdapter: MoonCallAdapter)
abstract class RestClient {

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/movie/popular')
  Future<NetResult<BaseList<Movie>>> getPopularMovies(@Query('page') int page);

  @GET('/movie/top_rated')
  Future<NetResult<BaseList<Movie>>> getTopRatedMovies(@Query('page') int page);

  @GET('/trending/movie/day')
  Future<NetResult<BaseList<Movie>>> getTrendingMovies(@Query('page') int page);

  @GET('/search/movie')
  Future<NetResult<BaseList<Movie>>> searchMovies(@Query('query') String query, @Query('page') int page);

  @GET('/movie/{movie_id}')
  Future<NetResult<Movie>> getMovieDetail(@Path('movie_id') int movieId);

  @GET('/movie/{movie_id}/credits')
  Future<NetResult<CastersOfMovie>> getMovieCasters(@Path('movie_id') int movieId);

  @GET('/person/{person_id}')
  Future<NetResult<Person>> getCasterInfo(@Path('person_id') int personId);

  @GET('/person/{person_id}/movie_credits')
  Future<NetResult<MoviesOfCaster>> getMoviesOfCaster(@Path('person_id') int personId);

}

class MoonCallAdapter<T> extends CallAdapter<Future<NetResult<T>>, Future<NetResult<T>>> {
  @override
  Future<NetResult<T>> adapt(Future<NetResult<T>> Function() call) async {
    try {
      return await call();
    } catch (e) {
      AppLogger.d('MovieCallAdapter error: $e T is ${T.toString()}');
      return NetResult();
    }
  }
}