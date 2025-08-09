import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yj_moive/generated/locales.g.dart';
import 'package:yj_moive/modules/movie_list/presentation/move_list_view.dart';
import 'package:yj_moive/modules/movie_list/provider/movie_list.dart';

class SearchMoviePage extends HookConsumerWidget {
  const SearchMoviePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final listNotifier = ref.read(searchMovieListProvider.notifier);

    final editingController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: editingController,
          decoration: InputDecoration(
            isDense: true,
            hintText: LocaleKeys.movieSearchHint.tr,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white,
          ),
          onSubmitted: (query) {
            listNotifier.search(query);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              listNotifier.search(editingController.text);
            },
          ),
        ],
      ),
      body: MovieListView(isPopular: null),
    );
  }
}
