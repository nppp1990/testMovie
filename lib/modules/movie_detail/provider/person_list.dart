import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yj_moive/network/model/business/movie/cast.dart';
import 'package:yj_moive/network/request_manager.dart';

final personResultProvider = FutureProvider.autoDispose.family<CastersOfMovie?, int>((ref, movieId) async {
  final res = await RequestManager().client.getMovieCasters(movieId);
  return res.data;
});
