import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yj_moive/modules/movie_list/presentation/move_list_view.dart';

class MoviePage extends HookWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialIndex: 0, initialLength: 2);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              controller: tabController,
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              indicatorColor: Colors.yellow,
              indicatorWeight: 4.0,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.symmetric(horizontal: 10),
              indicatorPadding: EdgeInsets.only(bottom: 8),
              tabs: [
                Tab(text: 'Popular'),
                Tab(text: 'Trending'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  KeepAliveMovieListView(isPopular: true),
                  KeepAliveMovieListView(isPopular: false),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
