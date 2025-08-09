import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:yj_moive/modules/actor_detail/presentation/actor_detail_page.dart';
import 'package:yj_moive/modules/movie_detail/presentation/movie_detail_page.dart';
import 'package:yj_moive/modules/movie_list/presentation/movie_page.dart';
import 'package:yj_moive/modules/movie_list/presentation/search_movie_page.dart';
import 'package:yj_moive/modules/splash/splash_page.dart';

abstract class Routes {
  static const splash = '/splash';
  static const home = '/home';
  static const search = '/search';
  static const movieDetail = '/movieDetail';
  static const actorDetail = '/actorDetail';

  static final pageRoutes = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: home, page: () => const MoviePage()),
    GetPage(name: search, page: () => const SearchMoviePage()),
    GetPage(name: movieDetail, page: () => const MovieDetailPage()),
    GetPage(name: actorDetail, page: () => const ActorDetailPage()),
  ];
}
