import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yj_moive/network/model/business/movie/movie.dart';
import 'package:yj_moive/network/request_manager.dart';

final actorMovieListProvider = FutureProvider.autoDispose.family<List<Movie>?, int>((ref, actorId) async {
  final response = await RequestManager().client.getMoviesOfCaster(actorId);
  if (response.data != null) {
    return response.data!.castMovies;
  }
  return null;
});