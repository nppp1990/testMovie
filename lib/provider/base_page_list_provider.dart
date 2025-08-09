import 'package:yj_moive/network/model/response/list.dart';
import 'package:yj_moive/provider/base_page_list_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin BaseListNotifier<U, T extends BasePageListState<U>> on StateNotifier<T> {
  void refresh() {
    state = state.copyWith(isLoading: true, items: <U>[], error: null) as T;
    loadInitialItems();
  }

  void loadInitialItems() async {
    state = state.copyWith(isLoading: true, page: 1, totalPages: 1) as T;
    try {
      final res = await fetchData();
      if (res != null) {
        state = state.copyWith(isLoading: false, items: res.data, page: res.page, totalPages: res.totalPages, error: null) as T;
      } else {
        state = state.copyWith(isLoading: false, error: 'Failed to load data') as T;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString()) as T;
    }
  }

  void loadMore() async {
    if (state.isLoading || !state.hasMore) {
      return;
    }
    state = state.copyWith(isLoading: true, page: state.page + 1) as T;
    try {
      final res = await fetchData();
      if (res != null && res.data.isNotEmpty) {
        state = state.copyWith(
          isLoading: false,
          items: [...state.items, ...res.data],
          page: res.page,
          totalPages: res.totalPages,
          error: null,
        ) as T;
      } else {
        state = state.copyWith(isLoading: false, error: 'Failed to load more data') as T;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString()) as T;
    }
  }

  Future<BaseList<U>?> fetchData();
}
