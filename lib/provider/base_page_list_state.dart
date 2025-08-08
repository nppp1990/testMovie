const unset = Object();

class BasePageListState<T> {
  final List<T> items;
  final bool isLoading;
  final int page;
  final int totalPages;
  final String? error;

  BasePageListState({
    required this.items,
    required this.isLoading,
    required this.page,
    required this.totalPages,
    this.error,
  });

  bool get hasMore => page < totalPages;

  bool get isLoadingMore => isLoading && hasMore;

  BasePageListState<T> copyWith({
    Object? items = unset,
    Object? isLoading = unset,
    Object? page = unset,
    Object? totalPages = unset,
    Object? error = unset,
  }) {
    return BasePageListState<T>(
      items: items == unset ? this.items : items as List<T>,
      isLoading: isLoading == unset ? this.isLoading : isLoading as bool,
      page: page == unset ? this.page : page as int,
      totalPages: totalPages == unset ? this.totalPages : totalPages as int,
      error: error == unset ? this.error : error as String?,
    );
  }
}
