import 'package:get/get.dart';
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

final searchMovieListProvider = AutoDisposeStateNotifierProvider<SearchMovieListNotifier, SearchMovieListState>(
  (ref) => SearchMovieListNotifier(SearchMovieListState(query: '', items: [], isLoading: false, page: 1, totalPages: 1)),
);

class PopularMovieListNotifier extends StateNotifier<MovieListState>
    with BaseListNotifier<Movie, MovieListState> {
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

class TrendingMovieListNotifier extends StateNotifier<MovieListState>
    with BaseListNotifier<Movie, MovieListState> {
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

class SearchMovieListNotifier extends StateNotifier<SearchMovieListState>
    with BaseListNotifier<Movie, SearchMovieListState> {
  SearchMovieListNotifier(super.state);

  void search(String query) {
    if (query.isEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          message: 'Query cannot be empty',
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    state = SearchMovieListState(query: query, items: [], isLoading: true, page: 1, totalPages: 1);
    loadInitialItems();
  }

  @override
  Future<BaseList<Movie>?> fetchData() async {
    final res = await RequestManager().client.searchMovies(state.query, state.page);
    if (res.data != null) {
      return res.data!;
    } else {
      return null;
    }
  }
}
