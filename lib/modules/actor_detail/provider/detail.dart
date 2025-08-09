import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yj_moive/network/model/business/movie/cast.dart';
import 'package:yj_moive/network/request_manager.dart';

final actorDetailProvider = FutureProvider.autoDispose.family<Person, int>((ref, actorId) async {
  final response = await RequestManager().client.getCasterInfo(actorId);
  if (response.data == null) {
    throw Exception('Failed to load actor details');
  }
  return response.data!;
});
