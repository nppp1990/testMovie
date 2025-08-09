import 'package:yj_moive/network/model/business/movie/movie.dart';
import 'package:yj_moive/provider/base_page_list_state.dart';

class MovieListState extends BasePageListState<Movie> {
  MovieListState({
    required super.items,
    required super.isLoading,
    required super.page,
    required super.totalPages,
    super.error,
  });

  @override
  BasePageListState<Movie> copyWith({
    Object? items = unset,
    Object? isLoading = unset,
    Object? page = unset,
    Object? totalPages = unset,
    Object? error = unset,
  }) {
    return MovieListState(
      items: items == unset ? this.items : items as List<Movie>,
      isLoading: isLoading == unset ? this.isLoading : isLoading as bool,
      page: page == unset ? this.page : page as int,
      totalPages: totalPages == unset ? this.totalPages : totalPages as int,
      error: error == unset ? this.error : error as String?,
    );
  }
}

class SearchMovieListState extends MovieListState {
  final String query;

  SearchMovieListState({
    required this.query,
    required super.items,
    required super.isLoading,
    required super.page,
    required super.totalPages,
    super.error,
  });

  @override
  BasePageListState<Movie> copyWith({
    Object? query = unset,
    Object? items = unset,
    Object? isLoading = unset,
    Object? page = unset,
    Object? totalPages = unset,
    Object? error = unset,
  }) {
    return SearchMovieListState(
      query: query == unset ? this.query : query as String,
      items: items == unset ? this.items : items as List<Movie>,
      isLoading: isLoading == unset ? this.isLoading : isLoading as bool,
      page: page == unset ? this.page : page as int,
      totalPages: totalPages == unset ? this.totalPages : totalPages as int,
      error: error == unset ? this.error : error as String?,
    );
  }
}
