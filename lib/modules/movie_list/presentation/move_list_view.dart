import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yj_moive/modules/movie_list/presentation/move_list_item.dart';
import 'package:yj_moive/modules/movie_list/provider/movie_list.dart';

class KeepAliveMovieListView extends StatefulWidget {
  final bool isPopular;

  const KeepAliveMovieListView({super.key, required this.isPopular});

  @override
  State<KeepAliveMovieListView> createState() => _KeepAliveMovieListViewState();
}

class _KeepAliveMovieListViewState extends State<KeepAliveMovieListView> with AutomaticKeepAliveClientMixin<KeepAliveMovieListView> {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MovieListView(isPopular: widget.isPopular);
  }
}

class MovieListView extends HookConsumerWidget {
  final bool isPopular;

  const MovieListView({super.key, required this.isPopular});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieListState = isPopular
        ? ref.watch(popularMovieListProvider)
        : ref.watch(trendingMovieListProvider);
    final listNotifier = isPopular
        ? ref.read(popularMovieListProvider.notifier)
        : ref.read(trendingMovieListProvider.notifier);

    final scrollController = useScrollController();
    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 50) {
          listNotifier.loadMore();
        }
      });
      return null;
    }, []);


    print('----error: ${movieListState.error}');

    if (movieListState.items.isEmpty) {
      if (movieListState.isLoading) {
        // 如果没有数据且正在加载，显示loading状态
        return const Center(child: CircularProgressIndicator());
      } else if (movieListState.error != null) {
        // 如果没有数据且有错误，显示错误信息 todo refresh ui
        return Center(child: Text('Error: ${movieListState.error}'));
      } else {
        return const Center(child: Text('No movies available'));
      }
    }

    return ListView.builder(
      controller: scrollController,
      itemExtent: 150 + 1 + 30, // 150 for item height, 1 for divider, 30 for padding
      itemCount: movieListState.items.length + (movieListState.isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == movieListState.items.length) {
          return const Center(child: CircularProgressIndicator());
        }

        final movie = movieListState.items[index];
        return MovieListItemView(movie: movie);
      },
    );

  }
}