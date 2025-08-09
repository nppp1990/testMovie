import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yj_moive/network/model/business/movie/movie.dart';
import 'package:yj_moive/network/request_manager.dart';

final movieDetailProvider = FutureProvider.autoDispose.family<Movie?, int>((ref, movieId) async {
  final res = await RequestManager().client.getMovieDetail(movieId);
  return res.data;
});
