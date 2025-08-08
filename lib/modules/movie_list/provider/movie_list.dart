import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yj_moive/modules/movie_list/state/movie_lsit.dart';
import 'package:yj_moive/network/model/business/movie/movie.dart';
import 'package:yj_moive/network/model/response/list.dart';
import 'package:yj_moive/network/request_manager.dart';
import 'package:yj_moive/provider/base_page_list_provider.dart';


final popularMovieListProvider = AutoDisposeStateNotifierProvider<PopularMovieListNotifier, MovieListState>(
  (ref) => PopularMovieListNotifier(MovieListState(items: [], isLoading: false, page: 1, totalPages: 1)),
);

final trendingMovieListProvider = AutoDisposeStateNotifierProvider<TrendingMovieListNotifier, MovieListState>(
  (ref) => TrendingMovieListNotifier(MovieListState(items: [], isLoading: false, page: 1, totalPages: 1)),
);


class PopularMovieListNotifier extends StateNotifier<MovieListState> with BaseSeekingListNotifier<Movie, MovieListState> {
  PopularMovieListNotifier(super.state) {
    loadInitialItems();
  }

  @override
  Future<BaseList<Movie>?> fetchData() async {
    final res = await RequestManager().client.getPopularMovies(state.page);
    if (res.data != null) {
      return res.data!;
    } else {
      return null;
    }
  }
}

class TrendingMovieListNotifier extends StateNotifier<MovieListState> with BaseSeekingListNotifier<Movie, MovieListState> {
  TrendingMovieListNotifier(super.state) {
    loadInitialItems();
  }

  @override
  Future<BaseList<Movie>?> fetchData() async {
    final res = await RequestManager().client.getTrendingMovies(state.page);
    if (res.data != null) {
      return res.data!;
    } else {
      return null;
    }
  }
}