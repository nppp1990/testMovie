import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:yj_moive/generated/locales.g.dart';
import 'package:yj_moive/modules/movie_list/presentation/move_list_view.dart';
import 'package:yj_moive/routes/index.dart';

class MoviePage extends HookWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialIndex: 0, initialLength: 2);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabBar(
                  isScrollable: true,
                  controller: tabController,
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                  unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
                  indicatorColor: Colors.yellow,
                  indicatorWeight: 4.0,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  indicatorPadding: EdgeInsets.only(bottom: 8),
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(text: LocaleKeys.popular.tr),
                    Tab(text: LocaleKeys.trending.tr),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.black),
                  onPressed: () {
                    // Get.to(() => SearchMoviePage());
                    Get.toNamed(Routes.search);
                  },
                ),
              ],
            ),
            Divider(height: 1, color: Colors.grey[300]),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [KeepAliveMovieListView(isPopular: true), KeepAliveMovieListView(isPopular: false)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
